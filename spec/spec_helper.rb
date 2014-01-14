require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  require 'pry'
  require 'ffaker'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.infer_base_class_for_anonymous_controllers = false

    config.include FactoryGirl::Syntax::Methods

    config.include Sorcery::TestHelpers::Rails

    config.order = "random"

    DatabaseCleaner.strategy = :truncation

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

  end

end

Spork.each_run do
  load "#{Rails.root}/db/schema.rb"
end
