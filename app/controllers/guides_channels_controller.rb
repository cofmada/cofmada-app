class GuidesChannelsController < ApplicationController
    before_action :require_user_logged_in
    
  def create
    channel = Channel.find(params[:channel_id])
    @guide.add_channel(channel)
    flash[:success] = 'チャンネルを追加しました!'
    redirect_to @guide
  end

  def destroy
    channel = Guides_Channel.find(params[:channel_id])
    current_user.lift_channel(channel)
    flash[:success] = 'チャンネルを解除しました。'
    redirect_to @guide
  end
end
