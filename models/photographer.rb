class Photographer < ActiveRecord::Base
  has_many :photos
  has_many :albums
  validates :name, presence: true
  validates :hometown, presence: true
end