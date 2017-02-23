require 'active_record'
require_relative 'ipsum'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'development.sqlite3'
)

class ApplicationMigration < ActiveRecord::Migration
  def up
    create_table "ipsums", force: true do |t|
      t.string  "title"
      t.text    "text"
    end
  end
end

ApplicationMigration.migrate(:up)

Ipsum.create(title: 'hipter',   text: 'I am hip')
Ipsum.create(title: 'samuel',   text: 'samuel says')
Ipsum.create(title: 'standard', text: 'standard')
