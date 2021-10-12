class GuidesChannel < ApplicationRecord
  belongs_to :guide
  belongs_to :channel
  
  validates :guide_id, uniqueness:  { scope: :channel_id }
end
