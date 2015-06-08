class Order < ActiveRecord::Base
  attr_accessible :confirm_code, :project_id, :size, :user_id, :color, :amount, :confirmed, :payment_mode
  belongs_to :project
  belongs_to :user
  has_one :shipping_address
  has_one :coupon
  has_one :shopping_cart

  scope :confirmed, where(:confirmed => true)
  scope :active, where(:confirmed => false)

  def total
    (amount || shopping_cart.total).round || 0
  end

  def paypal_link(currency)
    cart_items = {}
    total_in_local_currency = 0
    shopping_cart.shopping_cart_items.each_with_index do |item, index|
      cart_items["item_name_#{index + 1}"] = item.project.title
      cart_items["item_number_#{index + 1}"] = item.project.id
      cart_items["quantity_#{index + 1}"] = item.quantity
      cart_items["amount_#{index + 1}"] = (item.price.to_i/EXCHANGE_RATES[currency]).ceil
      total_in_local_currency += (item.price.to_i/EXCHANGE_RATES[currency]).ceil
    end
    cart_items["item_name_#{shopping_cart.total_unique_items + 1}"] = "Shipping"
    cart_items["item_number_#{shopping_cart.total_unique_items + 1}"] = "0"
    cart_items["quantity_#{shopping_cart.total_unique_items + 1}"] = 1
    cart_items["amount_#{shopping_cart.total_unique_items + 1}"] = total_in_local_currency > 75 ? 0 : 10
    values = { 
      :business => PAYPAL[Rails.env]['email'],
      :cmd => '_cart',
      :upload => 1,
      :return => PAYPAL[Rails.env]['return_url'] + "?paypal=true&checksum=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), PAYPAL[Rails.env]['secret'], transaction_id)}",
      :discount_amount_cart => (discount/EXCHANGE_RATES[currency]).ceil,
      :currency_code => currency
    }
    values.merge!(cart_items)
    "#{PAYPAL[Rails.env]['url']}" + values.to_query
  end

  def instamojo_link
    checksum = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), INSTAMOJO[Rails.env]['salt'], "#{self.total}|#{self.id}|#{self.transaction_id}")
    values = "data_name=#{URI.escape(self.shipping_address.name)}&"\
             "data_email=#{URI.escape(self.user.email)}&"\
             "data_phone=#{URI.escape(self.shipping_address.phone_number)}&"\
             "data_amount=#{self.total}&"\
             "data_readonly=data_amount&"\
             "data_Field_2605=#{self.id}&"\
             "data_readonly=data_Field_2605&"\
             "data_hidden=data_Field_2605&"\
             "data_Field_85313=#{self.transaction_id}&"\
             "data_readonly=data_Field_85313&"\
             "data_hidden=data_Field_85313&"\
             "data_sign=#{checksum}&"\
             "embed=form"
    INSTAMOJO[Rails.env]['url'] + values
  end

  def discount
    self.reload
    return 0 unless coupon
    if coupon.coupon_type == Coupon::PERCENTAGE
      discount_amount = (shopping_cart.total * coupon.value / 100).round
    elsif coupon.coupon_type == Coupon::FIXED
      discount_amount = coupon.value > shopping_cart.total ? (shopping_cart.total - 10).round : coupon.value.round
    else 
      discount_amount = 0
    end
    return discount_amount
  end

  def shipping_cost(currency)
    if currency == 'INR'
      return 0
    else
      return 10 * EXCHANGE_RATES[currency]
    end
  end

  def projects
    shopping_cart.shopping_cart_items.collect(&:project) if shopping_cart
  end

  def shipping_date
    projects.collect(&:shipping_date).max rescue (Date.today + 10.days)
  end

  def complete(payment_mode)
    self.update_attributes({:confirmed => true, :confirm_code => "#{self.shopping_cart.id}##{self.id}", :payment_mode => payment_mode})
    coupon.try(:used!)
    shopping_cart.update_attributes({:status => false})
    shopping_cart.try(:sold!)
    OrderMailer.confirm_email(self).deliver
    OrderMailer.success(self).deliver
  end

  def verify_zwitch_transaction_checksum(status, transaction_id, amount, checksum)
    api_key = ZWITCH[Rails.env]['api_key']
    api_secret = ZWITCH[Rails.env]['api_secret']
    computed_checksum = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), api_secret, "#{transaction_id}|#{amount}|#{api_key}|#{status}")
    checksum == computed_checksum
  end

  def verify_paypal_transaction_checksum(checksum)
    secret = PAYPAL[Rails.env]['secret']
    computed_checksum = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), secret, self.transaction_id.to_s)
    checksum == computed_checksum
  end

  def verify_instamojo_transaction_checksum(order, payment_id)
    response = Curl.get("https://www.instamojo.com/api/1.1/payments/#{payment_id}/") do |http|
      http.headers['X-Api-Key'] = INSTAMOJO[Rails.env]['api_key']
      http.headers['X-Auth-Token'] = INSTAMOJO[Rails.env]['auth_token']
    end
    response_json = JSON.parse(response.body)

    response_json["success"] && response_json["payment"]["amount"].to_i == order.total && 
      response_json["payment"]["custom_fields"]["Field_2605"]["value"].to_i == order.id &&
      response_json["payment"]["custom_fields"]["Field_85313"]["value"] == order.transaction_id rescue false
    
  end

end
