require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'development.sqlite3'
  )
require_relative 'hipster'
require_relative 'samuel'
require_relative 'standard'
require_relative 'ipsum'

text = Ipsum.where(:name=='hipster').first.get_text
puts text
