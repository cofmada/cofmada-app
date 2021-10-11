class Channel < ApplicationRecord
  belongs_to :user
  has_many :guides_channel
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :media, presence: true, length: { maximum: 255 }
end
