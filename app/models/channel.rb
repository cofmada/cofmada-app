class Channel < ApplicationRecord
  belongs_to :user
  has_many :guides_channels, dependent: :destroy
  has_many :affilication, through: :guides_channels, source: :guide
  
  validates :channel_name, presence: true, length: { maximum: 255 }
  validates :media, presence: true, length: { maximum: 255 }
  
end
