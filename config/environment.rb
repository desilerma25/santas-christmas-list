ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'dotenv/load'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

require './app/controllers/application_controller'
require_all 'app'
