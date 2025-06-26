class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Email.where(sended: false).each do |email|
      send_email(email)
    end
  end

  private

  def send_email(email)
    return if email.scheduled_at.present? && email.scheduled_at > Time.current

    EmailMailer.send_email(email).deliver_now
    email.update(sended: true)
  end
end
