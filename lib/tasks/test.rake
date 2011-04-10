require "tests"
namespace :test do
  task :load_models do
    Tester.new().load_models
  end
  task :load_db => :environment do
    Tester.new().load_db
  end
end