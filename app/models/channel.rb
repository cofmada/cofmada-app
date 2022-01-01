class Channel < ApplicationRecord
  belongs_to :user
  has_many :guides_channels, dependent: :destroy
  has_many :guides, through: :guides_channels
  has_many :videos
  
  validates :channel_name, presence: true, length: { maximum: 50 }
  validates :ch_url, url: { allow_blank: true }
  validates :icon, url: { allow_blank: true }
end
