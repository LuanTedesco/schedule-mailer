# Use bash -l -c para garantir que o RVM seja carregado
set :job_template, "bash -l -c ':job'"

require_environment = "require \"#{path}/config/environment\""

rvm_script_path = '$HOME/.rvm/scripts/rvm'

every 1.minute do
  command "#{path}/config/sh/check.sh >> #{path}/log/restart.log 2>&1"
end

every '0 0-23/3 * * *' do
  command "#{path}/config/sh/backup.sh >> #{path}/log/backup.log 2>&1"
end

every 1.day, at: '12:00 am' do
  command "source #{rvm_script_path} && ruby -e '#{require_environment}; UpdateCompaniesJob.new.run' >> #{path}/log/update_companies.log 2>&1"
end

every 1.day, at: '12:15 am' do
  command "source #{rvm_script_path} && ruby -e '#{require_environment}; NotificationVencimentTaskJob.new.run' >> #{path}/log/notification_venciment_task.log 2>&1"
end

every 1.day, at: '12:30 am' do
  command "source #{rvm_script_path} && ruby -e '#{require_environment}; NotificationVencimentSubTaskJob.new.run' >> #{path}/log/notification_venciment_subtask.log 2>&1"
end
