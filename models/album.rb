class Album < ActiveRecord::Base
  has_and_belongs_to_many :photos
  validates :subject, presence: true
  validates :photographer_id, presence: true
end