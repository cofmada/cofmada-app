class GuideVideo < ApplicationRecord
  belongs_to :guide
  belongs_to :video
  
  validates :start_h, numericality: { only_integer: true, in: 0..23 }
  validates :start_m, numericality: { only_integer: true }
  validates :video_id, uniqueness: { scope: [:guide_id, :start_h, :start_m] }
end
