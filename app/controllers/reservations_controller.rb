class ReservationsController < ApplicationController
  def index
      @user = current_user
      @reservations = Reservation.all
      
      

      end
  
    def create
      @user = current_user
      @reservation = Reservation.new(reservation_params)
      binding.pry
      if @reservation.save
          flash[:success] = "予約が完了しました"
          redirect_to reservation_path
        else
          flash[:success] = "予約に失敗しました"
          @rooms = Room.all
          render 'rooms/index'
      end
    end
  

    def new
    
      @user = current_user
      
      @reservation = Reservation.new(reservation_params)
     
      @room = Room.find_by(params[:room_id])
    end
  
    private

  def reservation_params
    params.permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id)
  end
  


end