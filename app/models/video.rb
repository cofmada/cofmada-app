class Video < ApplicationRecord
  belongs_to :channel
  has_many :guides_videos, dependent: :destroy
  has_many :guides, through: :guides_videos
  
  validates :video_name, presence: true, length: { maximum: 100 }, uniqueness: { scope: [:video_url, :thumbnail] }
  validates :video_url, allow_blank: true, uniqueness: true
  validates :thumbnail, allow_blank: true, uniqueness: true

end
