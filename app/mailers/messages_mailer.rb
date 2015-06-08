class MessagesMailer < ActionMailer::Base
  default from: "QREOH <hello@qreoh.com>"
  layout 'inbound_mailer'

  def notify(message)
    @message = message
    mail(to: NOTIFICATION_EMAIL, reply_to: message.user.email, subject: "New message on QREOH")
  end

  def create(message)
    @message = message
    mail(to: message.recipient.email, reply_to: message.user.email, subject: 'You have a new message on QREOH') if message && message.recipient
  end
end