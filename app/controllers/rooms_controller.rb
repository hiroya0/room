class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    
  end

  def new
    @room = Room.new
  end

  def create
    binding.pry
    @room = Room.new(params.require(:room).permit(:name, :introduction, :address, :price, :room_image))
    binding.pry
    if @room.save
      binding.pry
      flash[:success] = "部屋を新規登録しました"
      redirect_to :rooms
     else
       render "new"
     end
  end

  def show
    @room = Room.find(params[:id])
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

  
end
