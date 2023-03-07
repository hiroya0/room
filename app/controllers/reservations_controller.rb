class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
   
    @reservations = Reservation.all
   
  end
  
    def create
      @user = current_user
      @room = Room.find(params[:reservation][:room_id])
      @reservation = Reservation.new(params.require(:reservation).permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id))     
     
      if @reservation.save
       redirect_to @reservation
      else
      flash[:success] = "予約に失敗しました"
      @user = current_user
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
      @user = current_user
      @reservation = Reservation.find(params[:id])
     
    end

end