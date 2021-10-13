class Guide < ApplicationRecord
  belongs_to :user
  has_many :guides_channels, dependent: :destroy
  has_many :registered, through: :guides_channels, source: :channel
  
  validates :guide_name, presence: true, length: { maximum: 255 }
  
  def add_channel(ch)
    self.guides_channels.find_or_create_by(channel_id: ch.id)
  end
  
  def lift_channel(ch)
    guidechannel = self.guides_channels.find_by(channel_id: ch.id)
    guidechannel.destroy if guidechannel
  end
  
  def adding?(ch)
    self.registered.include?(ch)
  end

end
