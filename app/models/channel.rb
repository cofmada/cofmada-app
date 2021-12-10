class Channel < ApplicationRecord
  belongs_to :user
  has_many :guides_channels, dependent: :destroy
  has_many :guides, through: :guides_channels
  has_many :videos
  
  validates :search, presence: true, length: { maximum: 20 }
end
