#whenever --update-crontab

set :output, "log/cron.log"

every 1.minute do
  runner "SendEmailsJob.perform_later"
end
