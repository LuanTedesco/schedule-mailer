class EmailMailer < ApplicationMailer
  def send_email(email)
    @body = email.body
    @sender = email.user.email
    mail(to: email.to, subject: email.subject)
  end
end
