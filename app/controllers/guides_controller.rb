class GuidesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_guide, only:[:edit,:update,:destroy]

  def index
    @pagy,@guides = pagy(current_user.guides.all, items:10)
  end

  def new
    @guide = current_user.guides.build
  end

  def create
    @guide = current_user.guides.build(guide_params)

    if @guide.save
      flash[:success] = '番組表を登録しました！'
      redirect_to guides_path
    else
      flash.now[:danger] = '登録できませんでした・・・'
      render :new
    end
  end

  def show
    @guide = Guide.find(params[:id])
    @pagy,@guidechannels = pagy(@guide.registered.all, items:10)
  end

  def edit
    @guide = current_user.guides.find_by(id: params[:id])
    @pagy,@guidechannels = pagy(@guide.registered.all, items:10)
  end

  def update
    if @guide.update(guide_params)
      flash[:success] = "番組表を更新しました！"
      redirect_to guides_path
    else
      flash.now[:danger] = '更新できませんでした・・・もう一度入力してください・・・'
      render :edit
    end
  end

  def destroy
    @guide.destroy
    
    flash[:success] = '番組表番組表を削除しました'
    redirect_to guides_url
  end
  
  def registered
    @guide = Guide.find(params[:id])
    @pagy, @registered = pagy(@guide.registered.order(:id))
  end
  
  private
  
  def correct_guide
    @guide = current_user.guides.find_by(id: params[:id])
    unless @guide
      redirect_to root_url
    end
    channels = @guide.guides_channels.all
  end
    
  def guide_params
    params.require(:guide).permit(:guide_name, :user_id, :on_air)
  end
end
