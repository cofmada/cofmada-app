class Channel < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :delete_all
  
  validates :channel_name, presence: true, length: { maximum: 50 }
  validates :ch_url, url: { allow_blank: true }
  validates :icon, url: { allow_blank: true }
end
