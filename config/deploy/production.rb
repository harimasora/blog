# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production
set :stage, :production
set :branch, "master"
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :conditionally_migrate, true

server '162.243.96.232',
  user: fetch(:deploy_user),
  port: 1026,
  roles: [:web, :app, :db],
  primary: true

set :deploy_via, :remote_cache
set :use_sudo, false

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 5
