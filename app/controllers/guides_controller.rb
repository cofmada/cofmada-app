class GuidesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_guide, only:[:edit,:update,:destroy]

  def index
    @pagy,@guides = pagy(current_user.guides.all, items:5)
  end

  def new
    @guide = current_user.guides.build
  end

  def create
    @guide = current_user.guides.build(guide_params)

    if @guide.save
      flash[:success] = '登録完了！'
      redirect_to guides_path
    else
      flash.now[:danger] = '登録できませんでした...'
      render :new
    end
  end

  def show
    @guide = current_user.guides.find(params[:id])
    @pagy,@guidechannels = pagy(@guide.channels.all, items:10)
  end

  def edit
    @guide = current_user.guides.find_by(id: params[:id])
    @pagy,@guidechannels = pagy(@guide.channels.all, items:10)
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
    
  def guide_params
    params.require(:guide).permit(:guide_name, :user_id, :on_air)
  end
end
