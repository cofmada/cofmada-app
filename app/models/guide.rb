class Guide < ApplicationRecord
  belongs_to :user
  has_many :guides_channels
  has_many :channels, through: :guides_channels
  
  validates :name, presence: true, length: { maximum: 255 }
  
  
end
