class GuidesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_guide, only:[:show, :edit, :update, :destroy]

  def index
    @pagy,@guides = pagy(current_user.guides.all, items:5)
  end

  def new
    @guide = current_user.guides.build
    @channels = current_user.channels.all
  end

  def create
    check = current_user.guides.find_by(guide_name: guide_params[:guide_name], on_air: guide_params[:on_air])
    
    if check == nil
      @guide = current_user.guides.create(guide_params)
      @guide.guides_videos.create(v_id)
      flash[:success] = '登録完了！'
      redirect_to guides_path
    elsif check.present?
      check.guides_videos.create(v_id)
      flash[:success] = '追加完了！'
      redirect_to guides_path
    else
      flash.now[:danger] = '登録できませんでした...'
      render :new
    end
  end

  def show
    @pagy,@videos = pagy(@guide.videos.all, items:10)
    @channel_ids = @videos.distinct.pluck(:channel_id)
    @guide_channels = current_user.channels.find(@channel_ids)
    
  end

  def edit
    @pagy,@videos = pagy(@guide.videos.all, items:10)
    @channels = current_user.channels.all
  end

  def update
    if @guide.update(guide_params)
      flash[:success] = "更新完了！"
      redirect_to @guide
    else
      flash.now[:danger] = '更新できませんでした...'
      render :edit
    end
  end

  def destroy
    if request.referer&.include?("/guides/#{params[:id]}")
      @guide.videos.where(delete_ids).delete_all
      flash[:success] = '動画を削除しました。'
      redirect_to @guide
    else @guide.destroy
      flash[:success] = '番組表を削除しました。'
      redirect_to guides_url
    end
  end
  
  private
  
  def correct_guide
    @guide = current_user.guides.find_by(id: params[:id])
    unless @guide
      redirect_to root_url
    end
  end
  
  def guide_params
    params.require(:guide).permit(:guide_name, :on_air, :start_h, :start_m)
  end
  
  def v_id
    params.require(:guide).permit(:video_id)
  end
  
  def delete_ids
    params.require(:guide).permit(video_id: [])
  end
end
