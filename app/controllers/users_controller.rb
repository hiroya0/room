class UsersController < ApplicationController
  def index
    @users = User.all
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).includes(:user).order("created_at desc")
  end
  

  def new
    
  end

  def create
  end

  def show
    @user = current_user
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:image ))
      flash[:success] = "ユーザーの情報を更新しました"
      redirect_to users_path
    else
      render "users/edit"
    end
  end

  def destroy
  end

  def search
    @q = Room.ransack(params[:q])
  end
end
