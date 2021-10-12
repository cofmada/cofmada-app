class Channel < ApplicationRecord
  belongs_to :user
  has_many :guides_channels
  has_many :guides, through: :guides_channels
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :media, presence: true, length: { maximum: 255 }
  
end
