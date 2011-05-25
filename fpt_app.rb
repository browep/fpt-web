require 'sinatra'
require 'dm-core'
require 'dm-migrations'
require 'dm-sqlite-adapter'

class Log
  include DataMapper::Resource
  property :id,Serial
  property :text,String
  property :type,Integer

  def to_s
    "#{@type} #{@text}"
  end
end

configure do
  DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{Dir.pwd}/development.sqlite3"))
  DataMapper.auto_upgrade!
end


get "/" do
  @entries =Log.all
  erb :log
end

get "/test" do
  Log.create(:text=>"here is some text",:type=>0)
  redirect "/"
end


post "/reports/image" do
  
end


