
require 'rubygems'
require 'bundler/setup'
require "pry"
require "active_record"
require "sqlite3"
require "sinatra"
require "sinatra/reloader"

configure :development do
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'pics.db')
end

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/photographer.rb"
require_relative "models/photo.rb"
require_relative "models/album.rb"

require_relative "controllers/main.rb"

configure :production do  
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end


unless ActiveRecord::Base.connection.table_exists?(:photographers)
  ActiveRecord::Base.connection.create_table :photographers do |t|
    t.string :name
    t.string :hometown
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:photos)
  ActiveRecord::Base.connection.create_table :photos do |t|
    t.string :title
    t.string :location
    t.date :date
    t.integer :photographer_id
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:albums)
  ActiveRecord::Base.connection.create_table :albums do |t|
    t.string :subject
    t.integer :photographer_id
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:albums_photos)
  ActiveRecord::Base.connection.create_table :albums_photos, id: false do |t|
    t.integer :photo_id
    t.integer :album_id
  end  
end

