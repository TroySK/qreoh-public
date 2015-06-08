class ProjectMailer < ActionMailer::Base
  default from: "QREOH <skynet@qreoh.com>"
  layout 'inbound_mailer'

  def notify(project)
    @project = project
    mail(to: NOTIFICATION_EMAIL, subject: 'New Project on QREOH')
  end
end
