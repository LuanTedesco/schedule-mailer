#whenever --update-crontab

set :output, "log/cron.log"
set :environment, "development"

every 1.minute do
  runner "SendEmailsJob.new.run"
end
