class GuidesChannelsController < ApplicationController
    before_action :require_user_logged_in
    
  def create
    @guides_channel = @guide.guides_channels.build(params[:channel_id])
    @guides_channel.save
    flash[:success] = 'チャンネルを追加しました!'
    redirect_to guides_path
  end

  def destroy
    @guides_channel = @guide.guides_channels.find(params[:channel_id])
    @guide.channel.destroy
    flash[:success] = 'チャンネルを解除しました。'
    redirect_to edit_guide_path
  end
end
