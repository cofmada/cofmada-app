class Channel < ApplicationRecord
  belongs_to :user
  has_many :guides_channels, dependent: :destroy
  has_many :guides, through: :guides_channels
  
  validates :channel_name, presence: true, length: { maximum: 255 }
  validates :media, presence: true, length: { maximum: 255 }
  validates :begin_at, presence: true
  validates :close_at, presence: true

end
