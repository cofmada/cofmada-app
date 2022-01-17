class Guide < ApplicationRecord
  belongs_to :user
  has_many :guides_videos, dependent: :destroy
  has_many :videos, through: :guides_channels
  
  validates :guide_name, presence: true, length: { maximum: 50 }
  validates :on_air, presence: true, uniqueness: { scope: [:begin_at, :close_at] }
  validates :begin_at, presence: true
  validates :close_at, presence: true

  def regist(v)
    self.guides_videos.find_or_create_by(video_id: v.id)
  end
  
  def lift(ch)
    guides_videos = self.guides_videos.find_by(video_id: v.id)
    guides_videos.destroy if guides_videos
  end
end
