class Channel < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :guide_videos, through: :videos
  
  validates :channel_name, presence: true, length: { maximum: 50 }, uniqueness: { scope: [:channel_url, :icon] }
  validates :channel_url, url: { allow_blank: true }
  validates :icon, url: { allow_blank: true }
end
