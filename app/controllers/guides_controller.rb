class GuidesController < ApplicationController
    before_action :require_user_logged_in

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
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    
  def guide_params
    params.require(:guide).permit(:name, :user_id)
  end
end
