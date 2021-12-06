class Channel < ApplicationRecord
  belongs_to :user
  has_many :guides_channels, dependent: :destroy
  has_many :guides, through: :guides_channels
  
  validates :channel_name, presence: true, length: { maximum: 100 }
  validates :media, presence: true, length: { maximum: 10 }
  validates :begin_at, presence: true
  validates :close_at, presence: true
  validates :search, presence: true, length: { maximum: 20 }
end
