class Guide < ApplicationRecord
  belongs_to :user
  has_many :guides_channels, dependent: :destroy
  has_many :channels, through: :guides_channels
  
  validates :guide_name, presence: true, length: { maximum: 255 }
  
end
