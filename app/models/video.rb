class Video < ApplicationRecord
  
  validates :video_name, presence: true, length: { maximum: 50 }
  validates :url, allow_blank: true, uniqueness: true

  belongs_to :channel

end
