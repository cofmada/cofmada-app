class Play < ApplicationRecord
  belongs_to :guide_params
  has_many :play_videos, dependent: :destroy
  has_many :videos, through: :play_videos

  validates :start_h, numericality: { only_integer: true, in: 0..23 }
  validates :start_m, numericality: { only_integer: true }
end
