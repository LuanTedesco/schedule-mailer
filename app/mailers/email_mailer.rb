class EmailMailer < ApplicationMailer
  def send_email(email)
    @body = email.body
    mail(to: email.to, subject: email.subject)
  end
end
