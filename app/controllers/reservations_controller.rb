class ReservationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    
      @reservations = Reservation.all
      
      end
  
    def create
      
      @room = Room.find_by(params[:id])
      @user = User.find(current_user.id)
      @reservation = Reservation.new(params.require(:reservation).permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id))
      
     
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
      
      @user = User.find(current_user.id)
      binding.pry
      @room = Room.find_by(params[:id])
      binding.pry
      @reservation = Reservation.new(params.permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id))
      binding.pry
    end

    def destroy
      @reservation = Reservation.find_by(params[:reservation_id])
      @reservation.destroy
      flash[:success] = "予約を削除しました"
      redirect_to :reservations
    end

    def show
      @user = User.find(current_user.id)
      @room = Room.all
      @reservation = Reservation.find_by(params[:reservation_id])

      
      
      
    end
    
    private

  def reservation_params
    @rooms = Room.all
    params.permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id,)
  end
  


end