class ReservationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @reservations = Reservation.all
  end
  
      def new
      @user = User.find(current_user.id)
        @reservation = Reservation.new(params.require(:reservation).permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id))
      end

    def create
      @room = Room.find(params[:reservation][:room_id])
      @user = User.find(current_user.id)
      @reservation = Reservation.new(params.require(:reservation).permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id))     
      binding.pry
      if @reservation.save!
        
       flash[:success] = "予約が完了しました"
       
       binding.pry
       redirect_to @reservation
       

      else
      flash[:success] = "予約に失敗しました"
       render 'rooms/show'
      end
    end
  

   

    def destroy
      @reservation = Reservation.find(params[:reservation_id])
      @reservation.destroy
      flash[:success] = "予約を削除しました"
      redirect_to :reservations
    end

    def show
      @user_id = current_user.id
        @reservation = Reservation.new params.permit(:startday, :endday, :people, :totalprice, :totalday, :room_id, :user_id,)
      
    end
    
    


end