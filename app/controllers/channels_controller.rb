class ChannelsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_channel, only:[:show,:edit,:update,:destroy]
  
  def index
    @pagy,@channels = pagy(current_user.channels.all, items:10)
  end
  
  def new
    @channel = current_user.channels.build
    search(params[:search]) if params[:search].present?
  end
  
  def create
    @channel = current_user.channels.build(channel_params)
    if @channel.save
      flash[:success] = '登録完了！'
      redirect_to channels_path
    else
      flash.now[:danger] = '登録できませんでした...'
      render :new
    end
  end
  
  def show
   @videos = @channel.videos.all
  end
  
  def edit
    video_search(params[:video_name]) if params[:video_name].present?
    @video = @channel.videos.build
  end
  
  def update
    @video = @channel.videos.build(video_params) 
    
    if @channel.update(channel_params) || @video.save
      flash[:success] = "更新完了！"
      redirect_to action: :edit
    else
      flash.now[:danger] = '更新できませんでした...'
      render :edit
    end
  end
  
  def destroy
    if request.referer&.include?("/channels/#{params[:id]}")
      @channel.videos.where(id: delete_ids[:video_id]).delete_all
      flash[:success] = '動画を削除しました。'
      redirect_to @channel
    else @channel.destroy
      flash[:success] = 'チャンネル情報を削除しました。'
      redirect_to channels_url
    end
  end
  
  private
    
  def correct_channel
    @channel = current_user.channels.find_by(id: params[:id])
    unless @channel
      redirect_to root_url
    end
  end

  def channel_params
    params.require(:channel).permit(:channel_name, :icon, :channel_url, :search_key )
  end
  
  def video_params
    params.require(:channel).permit(:channel_id, :video_name, :media, :video_url, :thumbnail )
  end
  
  def delete_ids
    params.require(:channel).permit(video_id: [])
  end
end
