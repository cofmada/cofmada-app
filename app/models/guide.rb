class Guide < ApplicationRecord
  belongs_to :user
  has_many :guides_channel
  has_many :channel, through: :guides_channel, source: :channel
  
  validates :name, presence: true, length: { maximum: 255 }
  
end
