class Photo < ActiveRecord::Base
  has_and_belongs_to_many :albums
  validates :title, presence: true
  validates :location, presence: true
  validates :date, numericality: true
  validates :photographer_id, presence: true
  validates :url, presence: true
  
  
  def top_photo?
    if self.albums.length >= 3
      true
    else
      false
    end
  end
  
end



