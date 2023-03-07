class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :authenticate_user!

  def index
    @user = current_user.id
    @rooms = Room.all
   
  end

  def new
    @user = current_user.id
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :address, :price, :room_image))
    @room.user_id = current_user.id
    if @room.save!
    
      flash[:success] = "部屋を新規登録しました"
      redirect_to rooms_path
     else
       render "new"
     end
  end

  def show
    @user = current_user.id
		@room = Room.find(params[:id]) 
    
		@reservation = Reservation.new
   
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
     if @room.update(params.require(:room).permit(:name, :introduction, :address, :price, :room_image ))
       flash[:success] = "部屋の情報を更新しました"
       redirect_to rooms_path
     else
       render "edit"
     end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:success] = "部屋を削除しました"
    redirect_to :rooms
  end

  def search
    @results = @q.result(distinct: true)
  end

  private
  def room_params
    params.require(:room).permit(:name,:introduction,:price,:address,:room_image) 
  end
  
  def set_q
    @q = Room.ransack(params[:q])
  end
  
end
