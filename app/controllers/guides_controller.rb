class GuidesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_guide, only:[:show, :edit, :update, :destroy]

  def index
    @pagy,@guides = pagy(current_user.guides.all, items:5)
  end

  def new
    @guide = current_user.guides.build
    @channels = current_user.channels.all
    @air_times = current_user.air_times.all
  end

  def create
    check = current_user.guides.find_by(guide_name: guide_params[:guide_name], on_air: guide_params[:on_air])
    if check == nil
      @guide = current_user.guides.build(guide_params)
      if @guide.save
        create_model(@guide)
      else
        flash.now[:danger] = '登録できませんでした。名前と放送日を確認してください。'
        render :new
      end
    elsif check.present?
      create_model(check)
    else
      flash.now[:danger] = '登録できませんでした。入力内容を確認してください。'
      render :new
    end
  end

  def show
    @air_times = @guide.air_times.all
    @videos = @air_times.videos.distinct.pluck(:video_id)
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
    params.require(:guide).permit(:guide_name, :on_air)
  end
  
  def v_id
    params.require(:guide).permit(:video_id)
  end
  
  def air_time_params
    params.require(:air_time).permit(:start_h, :start_m)
  end
  
  def create_model(any)
    @air_time = current_user.air_times.find_by(air_time_params)
    @air_time_video = @air_time.air_time_videos.find_or_create_by(video_id: v_id)
    @air_time_guide = any.air_time_guides.create(air_time_id: @air_time.id)
  end
  
  def delete_ids
    params.require(:guide).permit(video_id: [])
  end
end
