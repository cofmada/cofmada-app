class GuidesChannel < ApplicationRecord
  belongs_to :guide
  belongs_to :video
  
  validates :guide_id, uniqueness:  { scope: :video_id }
  
end
