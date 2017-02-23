require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'development.sqlite3'
  )
require_relative 'hipster'
require_relative 'samuel'
require_relative 'standard'
require_relative 'ipsum'
require 'sinatra'

get "/" do
  "Hello World"
end

get "/:name" do
  "Hi there, #{params[:name]}"
end

get "/lorem/:ipsum" do
  title = params[:ipsum]
  text = Ipsum.find_by(:name==title).get_text
  if %w(standard hipster samuel).include? title
    text.upcase
  # elsif %w(standard hipster samuel).include? params[:ipsum]
    # Object.const_get(params[:ipsum].capitalize).call
  else
    redirect "/not_found"
  end
end

get "/not_found" do
  status 404
  "That ain't here"
end
