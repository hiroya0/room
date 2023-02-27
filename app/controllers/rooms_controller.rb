class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    
  end

  def new
    @room = Room.new
  end

  def create
    
    @room = Room.new(params.require(:room).permit(:name, :introduction, :address, :price, :room_image))
    @room.user_id = current_user.id
    if @room.save
    
      flash[:success] = "部屋を新規登録しました"
      redirect_to rooms_path
     else
       render "new"
     end
  end

  def show
    binding.pry
		@room = Room.find(params[:id]) 
    binding.pry
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

  private
  def room_params
    params.require(:room).permit(:name,:introduction,:price,:address,:room_image) 
  end
  
end
