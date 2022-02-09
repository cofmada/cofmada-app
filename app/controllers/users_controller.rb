class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show,:update]

  
  def show
    @user = User.find(params[:id])
    counts(@user)
    today = l Date.current
    @guide = @user.guides.find_by(on_air: today)
    @channels = @user.channels.all
    @videos = @user.videos.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザ登録完了！'
      redirect_to @user
    else
      flash.now[:danger] = '登録できませんでした...'
      render :new
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "画像更新完了！"
      redirect_to @user
    else
      flash.now[:danger] = '更新できませんでした...'
      render :show
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end

