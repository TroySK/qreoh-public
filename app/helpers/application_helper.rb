module ApplicationHelper

  def local_country_code
    if cookies[:current_country_code].blank?
      country_code = request.env['HTTP_CF_IPCOUNTRY']
      if country_code.blank?
        geo_ip = GeoIP.new('db/GeoIP.dat')
        country_code = geo_ip.country(request.env['HTTP_CF_CONNECTING_IP'] || request.remote_ip).country_code2
        country_code ||= request.location.data["country_code"]
      end
      country_code ||= 'IN'
      cookies[:current_country_code] = {:value => country_code, :expires => 7.days.from_now}
    end
    cookies[:current_country_code]
  end

  def local_currency
    CURRENCY[local_country_code] || 'USD'
  end

  def local_price(price)
    (price.to_i/EXCHANGE_RATES[local_currency]).ceil
  end

  def local_price_with_symbol(price)
    "#{CURRENCY_SYMBOLS[local_currency]} #{local_price(price)}".html_safe
  end

end
