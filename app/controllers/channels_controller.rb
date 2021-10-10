class ChannelsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:edit,:update,:destroy]
  
  def index
    @pagy,@channels = pagy(current_user.channels.all, items:10)
  end
  
  def new
    @channel = current_user.channels.build
  end
  
  def create
    @channel = current_user.channels.build(channel_params)
    
    if @channel.save
      flash[:success] = 'チャンネル情報を登録しました！'
      redirect_to @channel
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
      redirect_to @channels
    else
      flash.now[:danger] = '更新できませんでした・・・もう一度入力してください・・・'
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
    params.require(:channel).permit(:name, :media, :on_air, :begin_at, :close_at)
  end

  
end
