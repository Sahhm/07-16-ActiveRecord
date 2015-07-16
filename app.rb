require "pry"
require "active_record"
require "sqlite3"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'pics.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/photographer.rb"
require_relative "models/photo.rb"
require_relative "models/album.rb"

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
    t.integer :album_id
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
    t.belongs_to :photo, index: true
    t.belongs_to :album, index: true
  end  
end

binding.pry