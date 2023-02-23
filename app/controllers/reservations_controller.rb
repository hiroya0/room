class ReservationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    
      @reservations = Reservation.all
      
      end
  
    def create
      
      @room = Room.find(params[:id])
      @user = User.find(current_user.id)
      @reservation = Reservation.new(params.permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id))
      
     
      if @reservation.save
       
          flash[:success] = "予約が完了しました"
          redirect_to  controller: :reservations, action: :show
          
        else
          flash[:success] = "予約に失敗しました"
          @rooms = Room.all
          redirect_to :rooms
      end
    end
  

    def new
      
      @room = Room.find(params[:id])
      @user = User.find(current_user.id)
     
      @reservation = Reservation.new(params.permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id))
      
      
    end

    def destroy
      @reservation = Reservation.find(params[:reservation_id])
      @reservation.destroy
      flash[:success] = "予約を削除しました"
      redirect_to :reservations
    end

    def show
      binding.pry
      @reservation = Reservation.new(reservation_params)
      binding.pry
      @room = @reservation.room
      binding.pry
      
    end
    
    private

  def reservation_params
    @rooms = Room.all
    params.permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id,)
  end
  


end