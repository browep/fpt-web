# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FptWeb::Application.initialize!

LOGGLIER = Logglier.new(ENV['logglier_url'])

require "imgur"
IMGUR_API = Imgur::API.new(ENV['imgur_api_key'])
