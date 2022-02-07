class GuideVideo < ApplicationRecord
  belongs_to :guide
  belongs_to :video
  has_one :user, through: :guide
  has_one :channel, through: :video
  
  validates :start_h, presence: true
  validates :start_m, presence: true
  validates :guide_id, uniqueness: { scope: [:video_id, :start_h, :start_m] }
end
