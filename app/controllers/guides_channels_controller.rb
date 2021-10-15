class GuidesChannelsController < ApplicationController
    before_action :require_user_logged_in
    
  def create
    if GuidesChannel.exists?(guide_id: params[:guide_id], channel_id: params[:channel_id])
      flash[:danger] = 'すでに追加されています'
      redirect_to guide_path(params[:guide_id])
    else
      GuidesChannel.create(guide_id: params[:guide_id], channel_id: params[:channel_id])
      flash[:success] = 'チャンネルを追加しました!'
      redirect_to guide_path(params[:guide_id])
    end
  end

  def destroy
    @guides_channel = GuidesChannel.find_by(guide_id: params[:guide_id], channel_id: params[:id])
    @guides_channel.destroy
    flash[:success] = 'チャンネルを解除しました。'
    redirect_to guide_path(params[:guide_id])
  end
end
