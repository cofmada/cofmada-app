class ChannelsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:edit,:update,:destroy]
  
  def index
    @pagy,@channels = pagy(current_user.channels.all, items:10)
  end
  
  def new
    @channel = current_user.channels.build
    require 'google/apis/youtube_v3'
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials[:youtube_api_key]
    youtube_search_list = youtube.list_searches("snippet", type: "channel", q: 'フレン', max_results: 5)
    search_result = youtube_search_list.to_h
    @movies = search_result[:items]
  end
  
  def create
    @channel = current_user.channels.build(channel_params)
    
    if @channel.save
      flash[:success] = 'チャンネル情報を登録しました！'
      redirect_to channels_path
    else
      flash.now[:danger] = '登録できませんでした・・・'
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @channel.update(channel_params)
      flash[:success] = "チャンネル情報を更新しました！"
      redirect_to channels_path
    else
      flash.now[:danger] = '更新できませんでした・・・'
      render :edit
    end
  end
  
  def destroy
    @channel.destroy
    
    flash[:success] = 'チャンネル情報を削除しました'
    redirect_to channels_url
  end
  
  private
    
  def correct_user
    @channel = current_user.channels.find_by(id: params[:id])
    unless @channel
      redirect_to root_url
    end
  end

  def channel_params
    params.require(:channel).permit(:channel_name, :media, :begin_at, :close_at)
  end

end
