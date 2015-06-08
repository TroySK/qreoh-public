class DesignerMailer < ActionMailer::Base
  default from: 'Cece from QREOH <cece@qreoh.com>'
  layout 'inbound_mailer'

  def notify(designer)
    @designer = designer
    mail(from: 'skynet@qreoh.com', to: NOTIFICATION_EMAIL, subject: 'New Designer on QREOH')
  end

  def create(designer)
    @designer = designer
    mail(to: designer.user.email, subject: 'Welcome to the QREOH!') if designer && designer.user
  end

  def notify_approval(designer)
    @designer = designer
    mail(to: designer.user.email, subject: 'The next step on QREOH') if designer && designer.user
  end

  def notify_rejection(designer)
    @designer = designer
    mail(to: designer.user.email, subject: 'Update from QREOH') if designer && designer.user
  end

end
