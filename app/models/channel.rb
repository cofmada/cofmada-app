class Channel < ApplicationRecord
  belongs_to :user
  has_many :guides_channel
  has_many :guide, through: :guides_channels, source: :guide
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :media, presence: true, length: { maximum: 255 }
  
end
