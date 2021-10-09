class Channel < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :media, presence: true, length: { maximum: 255 }
end
