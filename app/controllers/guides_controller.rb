class GuidesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_guide, only:[:show, :edit, :update, :destroy]
  before_action :guide_videos, only:[:show, :edit]

  def index
    @pagy,@guides = pagy(current_user.guides.all, items:5)
  end

  def new
    @guide = current_user.guides.build
    @channels = current_user.channels.all
  end

  def create
    @guide = current_user.guides.find_or_create_by(guide_params)
    
    if @guide.save || @guide.present?
      @guide.guides_videos.create(video_id: v_id)
      flash[:success] = '登録完了！'
      redirect_to guides_path
    else
      flash.now[:danger] = '登録できませんでした...'
      render :new
    end

  end

  def show
  end

  def edit
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
    @guide.destroy
    
    flash[:success] = '番組表を削除しました。'
    redirect_to guides_url
  end
  
  private
  
  def correct_guide
    @guide = current_user.guides.find_by(id: params[:id])
    unless @guide
      redirect_to root_url
    end
  end
  
  def guide_videos
    @pagy,@guidevideos = pagy(@guide.videos.all, items:10)
  end
    
  def guide_params
    params.require(:guide).permit(:guide_name, :on_air, :begin_at, :close_at)
  end
  
  def v_id
    params.require(:guides_video).permit(:video_id)
  end
end
