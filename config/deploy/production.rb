# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production
set :stage, :production
set :branch, "master"
set :conditionally_migrate, true

# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
# set :server_name, "www.example.com example.com"

set :port, 1026
set :deploy_via, :remote_cache
set :use_sudo, false

server '162.243.96.232',
  port: fetch(:port),
  user: fetch(:deploy_user),
  roles: [:web, :app, :db],
  primary: true

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: fetch(:deploy_user)
}

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 5
