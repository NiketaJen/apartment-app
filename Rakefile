ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


# Type `rake -T` on your command line to see the available rake tasks.

desc 'starts a console'

task :console do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Pry.start
end
