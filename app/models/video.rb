class Video < ApplicationRecord
  belongs_to :channel
  has_many :guides_channels, dependent: :destroy
  has_many :guides, through: :guides_channels
  
  validates :video_name, presence: true, length: { maximum: 100 }
  validates :url, allow_blank: true, uniqueness: true

end
