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
      flash.now[:danger] = '登録できませんでした...<br>入力内容を確認してください。'
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
    @videos = @channel.videos.all
    @video = @channel.videos.build(video_params) if params[:video].present?
    if @video.present?
      if @video.save
        flash[:success] = "登録完了！"
        redirect_to edit_channel_path
      else
        flash.now[:danger] = '登録できませんでした...<br>入力内容を確認してください。'
        render :edit
      end
    elsif @channel.update(channel_params)
      flash[:success] = "更新完了！"
      redirect_to edit_channel_path
    else
      flash.now[:danger] = '登録できませんでした...<br>入力内容を確認してください。'
      render :edit
    end
  end
  
  def destroy
    if delete_ids.present?
      @channel.videos.where(id: delete_ids[:video_id]).destroy_all
      flash[:success] = '動画を削除しました。'
      redirect_to edit_channel_url
    elsif @channel.destroy
      flash[:success] = 'チャンネル情報を削除しました。'
      redirect_to channels_url
    else
      flash.now[:danger] = '削除できませんでした...<br>内容を確認してください。'
      render :edit
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
    params.require(:video).permit(:video_name, :media, :video_url, :thumbnail )
  end
  
  def delete_ids
    params.require(:channel).permit(video_id: []) if params[:channel].present?
  end
end
