class SendEmailsJob < ApplicationJob
  def run
    Email.where(sended: false).each do |email|
      send_email(email)
    end
  end

  private

  def send_email(email)
    return if email.scheduled_at.present? && email.scheduled_at > Time.current

    begin
      EmailMailer.send_email(email).deliver_now
      email.update(sended: true)
    rescue => e
      flash[:error] = "Falha ao enviar o e-mail: #{e.message}"
    end
  end
end
