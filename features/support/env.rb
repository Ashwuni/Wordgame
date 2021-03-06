# Generated by cucumber-sinatra. (2014-12-31 10:47:20 -0800)
require 'simplecov'
#SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'rack_session_access'
require 'byebug'

Capybara.app = WordgameApp
Capybara.app.configure do |app|
  app.use RackSessionAccess::Middleware
end

class WordgameAppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  WordgameAppWorld.new
end
