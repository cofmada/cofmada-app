class Guide < ApplicationRecord
  belongs_to :user
  has_many :guide_videos, dependent: :destroy
  has_many :videos, through: :guide_videos
  
  validates :guide_name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :on_air }
  validates :on_air, presence: true
  
end
