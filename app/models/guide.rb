class Guide < ApplicationRecord
  belongs_to :user
  has_many :guides_channels
  has_many :channels, through: :guides_channels
  
  validates :name, presence: true, length: { maximum: 255 }
  
  def add_channel(channel)
    unless
      self.guides_channels.find_or_create_by(channel_id: channel.id)
    end
  end
  
  def lift_channel(channel)
    guidechannel = self.guides_channels.find_by(channel_id: channel.id)
    guidechannel.destroy if guidechannel
  end
end
