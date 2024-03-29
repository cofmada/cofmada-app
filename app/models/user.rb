class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  mount_uploader :avatar, ImageUploader
  
  has_many :channels, dependent: :destroy
  has_many :guides, dependent: :destroy
  has_many :videos, through: :channels
  has_many :guide_videos, through: :guides
end
