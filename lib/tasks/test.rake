require "tests"
namespace :test do
  task :load_models do
    Tester.new().load_models
  end
end