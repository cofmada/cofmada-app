class Guide < ApplicationRecord
  belongs_to :user
  has_many :guides_channels, dependent: :destroy
  has_many :videos, through: :guides_channels
  
  validates :guide_name, presence: true, length: { maximum: 50 }
  validates :on_air, presence: true
  validates :id,  uniqueness: { scope: [:videoid, :begin_at, :close_at] }
  
  def regist(ch)
    self.guides_channels.find_or_create_by(channel_id: ch.id)
  end
  
  def lift(ch)
    guides_channels = self.guides_channels.find_by(channel_id: ch.id)
    guides_channels.destroy if guides_channels
  end
end
