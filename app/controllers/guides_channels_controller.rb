class GuidesChannelsController < ApplicationController
    before_action :require_user_logged_in
    
  def create
    ch = Channel.find(params[:channel_id])
    @guide.add_channel(ch)
    flash[:success] = 'チャンネルを追加しました!'
    redirect_to @guide
  end

  def destroy
    ch = GuidesChannel.find(params[:channel_id])
    current_user.lift_channel(ch)
    flash[:success] = 'チャンネルを解除しました。'
    redirect_to @guide
  end
end
