class OrderMailer < ActionMailer::Base
  default from: "QREOH <hello@qreoh.com>"
  layout 'inbound_mailer'

  def confirm_email(order)
    @order = order
    mail(to: @order.user.email, subject: 'Thanks! for placing your order on QREOH')
  end

  def success(order)
    @order = order
    mail(to: NOTIFICATION_EMAIL, subject: 'Congrats! There is a new order on QREOH')
  end

  def notify(order)
    @order = order
    mail(to: NOTIFICATION_EMAIL, subject: 'New order in progress')
  end

  def notify_shipping(order, courier, track_url, tracking_code)
    @values = {
      :name => order.shipping_address.name.split(' ').first,
      :courier => courier,
      :tracking_url => track_url,
      :tracking_code => tracking_code
    }
    mail(to: order.user.email, subject: 'Your order has been shipped by QREOH')
  end

  def confirm_delivery(order)
    @order = order
    mail(to: order.user.email, subject: 'Your order just got delivered by QREOH')
  end

  def pending_push(order)
    @order = order
    mail(to: order.user.email, from: "Troy from QREOH <troy@qreoh.com>", subject: 'Your cart misses you at QREOH')
  end

  def delayed(order)
    @order = order
    mail(to: order.user.email, subject: 'Sorry for the delay at QREOH')
  end

  def cod_verify(order)
    @order = order
    mail(to: NOTIFICATION_EMAIL, subject: 'COD opted at QREOH')
  end
end
