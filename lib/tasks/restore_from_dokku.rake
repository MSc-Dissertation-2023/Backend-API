require 'open-uri'

namespace :db do
  task :restore_from_dokku do
    # run this using rake db:restore_from_heroku to restore production db to local
    #
    # you may need to set up a .pgpass file if your local database config  requires password to restore
    # http://www.postgresql.org/docs/9.1/static/libpq-pgpass.html

    db_name = 'mdk_2023_development'
    db_user_name = 'yushengchang'

    temp_file_name = 'latest.dump'
    File.delete(temp_file_name) if File.exist?(temp_file_name)

    # # the heroku toolbelt comes with its own version of Ruby by default
    # # this will be invoked by Bundler causing a version mismatch without with_clean_env
    # heroku_backup_url = Bundler.with_clean_env { `heroku pg:backups public-url -a kaffa` }

    puts "Downloading latest DB dump from Dokku"

    system "ssh root@178.62.16.70 dokku postgres:export mdk-2023-database > #{temp_file_name}"

    puts "Finished downloading dump. Restoring to #{db_name}"

    system "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U #{db_user_name} -d #{db_name} #{temp_file_name}"

    puts "Finished restore to #{db_name}."
  end
end
