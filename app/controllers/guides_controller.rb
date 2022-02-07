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
      flash.now[:danger] = '登録できませんでした...<br>入力内容を確認してください。'
      render :new
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
    @guide_video = @guide.guide_videos.build
  end

  def update
    @channels = current_user.channels.all
    @videos = @guide.videos.all
    @guide_videos = @guide.guide_videos.all
    @start = @guide_videos.distinct.pluck(:start_h)
    @guide_video = @guide.guide_videos.build(time_params) if time_params.present?

    if @guide_video.present?
      if @guide_video.save
        flash[:success] = "登録完了！"
        redirect_to edit_channel_path
      else
        flash.now[:danger] = '登録できませんでした...<br>入力内容を確認してください。'
        render :edit
      end
    elsif @guide.update(guide_params)
      flash[:success] = '更新完了！'
      redirect_to edit_channel_path
    else
      flash.now[:danger] = '登録できませんでした...<br>入力内容を確認してください。'
      render :edit
    end
  end

  def destroy
    if delete_ids[:video_id].present?
      @guide.videos.where(id: delete_ids[:video_id]).destroy_all
      flash[:success] = '動画を削除しました。'
      redirect_to edit_guide_url
    elsif @guide.destroy
      flash[:success] = '番組表を削除しました。'
      redirect_to guides_url
    else
      flash.now[:danger] = '削除できませんでした...<br>内容を確認してください。'
      render :edit
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
    if params[:video_id].present?
      params.require(:guide).permit(video_id: [])
    else
      params.require(:guide)
    end
  end
  
end
