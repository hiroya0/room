class ReservationsController < ApplicationController
  def index
   @user_id = current_user.id
   binding.pry
   @reservations = Reservation.all
   binding.pry
  end
  
    def create
      @room = Room.find(params[:reservation][:room_id])
      @user = User.find(current_user.id)
      @reservation = Reservation.new(params.require(:reservation).permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id))     
     
      if @reservation.save!
       redirect_to @reservation
      else
      flash[:success] = "予約に失敗しました"
       render 'rooms/show'
      end
    end

    def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
      flash[:success] = "予約を削除しました"
      redirect_to :reservations
    end

    def show
      flash[:success] = "予約が完了しました"
      @user_id = current_user.id
      binding.pry
      @reservation = Reservation.find(params[:id])
      binding.pry
    end

end