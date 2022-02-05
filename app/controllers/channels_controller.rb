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
    @videos = @channel.videos.all
  end
  
  def update
    if video_params[:video_name].present?
      @video = @channel.videos.build(video_params)
      if @video.save
        flash[:success] = "登録完了！"
        redirect_to action: :edit
      else
        flash[:danger] = '名前が未入力か、既に登録されています。<br>入力内容を確認してください。'
        redirect_to action: :edit
      end
    elsif current_user.channels.find_by(channel_name: channel_params[:channel_name]) == nil
      @channel.update(channel_params)
      flash[:success] = "更新完了！"
      redirect_to action: :edit
    else
      flash[:danger] = '動画名が未入力か、既に登録されています。<br>入力内容を確認してください。'
      redirect_to action: :edit
    end
  end
  
  def destroy
    if delete_ids[:video_id].present?
      @channel.videos.where(id: delete_ids[:video_id]).destroy_all
      flash[:success] = '動画を削除しました。'
      redirect_to edit_channel_url
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
    if params[:video].present?
      params.require(:video).permit(:video_name, :media, :video_url, :thumbnail )
    else
      params.require(:channel)
    end
  end
  
  def delete_ids
    if params[:channel][:video_id].present?
      params.require(:channel).permit(video_id: [])
    else
      params.require(:channel)
    end
  end
end
