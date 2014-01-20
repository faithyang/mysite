require 'bundler/capistrano'

set :application, "mysite"
set :repository,  "git@github.com:straightdave/mysite.git"
set :deploy_to, "/home/dave/rorsites/mysite"
set :scm, :git
set :branch, "master"
set :user, "dave"
set :group, "dave"
set :use_sudo, true
set :rails_env, "production"
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true, :port => 2221, :keys => [File.join(ENV["HOME"], ".ssh","id_rsa")] }
#set :sudo_prompt, ""

set :keep_releases, 3
default_run_options[:pty] = true
server "dave5.me", :app, :web, :db, :primary => true

namespace :deploy do


  # NOTE: I don't use this anymore, but this is how I used to do it.
  desc "Precompile assets after deploy"
  task :precompile_assets do
    run <<-CMD
      cd #{ current_path } &&
      #{ sudo } bundle exec rake assets:precompile RAILS_ENV=#{ rails_env }
    CMD
  end

  desc "Restart applicaiton"
  task :restart do
    run "#{ try_sudo } touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
  end
  
  desc "backup images to shared folder"
  task :backup_images do
    run "cp -f #{ current_path + '/public/images/*.*'} #{ shared_path + '/images/' }"
  end
  
  desc "restore images"
  task :restore_images do
    run <<-CMD
      mkdir #{ current_path + '/public/images'} &&
      cp -f #{ shared_path + '/images/*.*'} #{ current_path + '/public/images/'}
    CMD
  end
  
end

before "deploy", "deploy:backup_images"

#after "deploy", "deploy:precompile_assets"
after "deploy", "deploy:migrate"

after "deploy", "deploy:restore_images"

after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
