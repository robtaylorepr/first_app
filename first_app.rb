require_relative 'hipster'
require_relative 'samuel'
require_relative 'standard'

require 'sinatra'

get "/" do
  "Welcome !"
end

get "/:name" do
  "Welcome #{params[:name]} !"
end

get "/lorem/:ipsum" do
  if %w(standard hipster samuel).include? params[:ipsum]
    Object.const_get(params[:ipsum].capitalize).call
  else
    redirect "/not_found"
  end
end

get "/not_found" do
  status 404
  "That ain't here"
end
