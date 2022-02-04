class Video < ApplicationRecord
  belongs_to :channel
  has_many :guide_videos, dependent: :destroy
  has_many :guides, through: :guide_videos
  has_one :user, through: :channel

  validates :video_name, presence: true, length: { maximum: 100 }, uniqueness: { scope: [:video_url, :thumbnail, :media] }
  validates :video_url, allow_blank: true, uniqueness: true
  validates :thumbnail, allow_blank: true, uniqueness: true

end
