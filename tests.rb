require 'rubygems'
require 'bundler/setup'
ENV['RACK_ENV'] = 'test'

require_relative 'first_app'
require 'test/unit'
require 'rack/test'
require 'faker'

class FirstAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_the_index
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end

  def test_names_page
    name = Faker::Name.first_name
    get "/#{name}"
    assert last_response.ok?
    assert_equal "Hi there, #{name}", last_response.body
  end

  def test_lipsums_page
    get "/lorem/hipster"
    assert last_response.ok?
    assert_equal "I am hip",last_response.body

    get "/lorem/samuel"
    assert last_response.ok?
    assert_equal "samuel says",last_response.body

    get "/lorem/standard"
    assert last_response.ok?
    assert_equal "standard",last_response.body
  end
end
