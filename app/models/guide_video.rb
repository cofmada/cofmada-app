class GuideVideo < ApplicationRecord
  belongs_to :guide
  belongs_to :video
  has_one :user, through: :guide
  has_one :channel, through: :video
  
  validates :start_h, numericality: { only_integer: true, in: 0..23 }
  validates :start_m, numericality: { only_integer: true }
  validates :guide_id, uniqueness: { scope: [:video_id, :start_h, :start_m] }
end
