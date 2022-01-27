class Guide < ApplicationRecord
  belongs_to :user
  has_many :guide_videos, dependent: :destroy
  has_many :videos, through: :guide_videos
  
  validates :guide_name, presence: true, length: { maximum: 50 }
  validates :on_air, presence: true
  
  def show_img(i,h,m)
    @vtr = self.videos.where(channel_id: i)
    @vtr.each do |v|
      @times = self.guide_videos.find_by(video_id: v.id, start_h: h, start_m: m)
      unless @times == nil
        @play = self.videos.find_by(id: @times.video_id)
        @thumb = @play.thumbnail
      end
    end
  end
end
