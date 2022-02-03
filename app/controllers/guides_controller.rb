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
    @guide = current_user.guides.build(guide_params)
    if @guide.save
      flash[:success] = '登録完了！'
      redirect_to guides_path
    else 
      flash[:danger] = '登録できませんでした。入力内容を確認してください。'
      redirect_to new_guide_path
    end
  end

  def show
    @channels = current_user.channels.all
    @videos = @guide.videos.all
    @guide_videos = @guide.guide_videos.all
    @start = @guide_videos.distinct.pluck(:start_h)
  end

  def edit
    @channels = current_user.channels.all
    @videos = @guide.videos.all
    @guide_videos = @guide.guide_videos.all
    @start = @guide_videos.distinct.pluck(:start_h)
  end

  def update
    @guide_video = @guide.guide_videos.find_or_create_by(time_params)
    
    if @guide.update(guide_params) || @guide_video.save
      flash[:success] = '更新完了！'
      redirect_to action: :edit
    else
      flash.now[:danger] = '登録できませんでした。入力内容を確認してください。'
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
    params.require(:guide).permit(:guide_name, :on_air)
  end
  
  def time_params
    params.require(:guide).permit(:video_id, :start_h, :start_m)
  end
  
  def delete_ids
    params.require(:guide).permit(video_id: [])
  end
  
end
