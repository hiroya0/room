class ReservationsController < ApplicationController
    def index
        @user = current_user
        @reservations = Reservation.all
        end
    
      def create
       
        @user = current_user
        
        @reservation = Reservation.new(params.require(:reservation).permit(:startday, :endday, :people, :totalprice, :totalday))
        
        if @reservation.save!
            flash[:success] = "予約が完了しました"
            redirect_to reservations_path
        else
            render "rooms/show"
        end
      end
    
      def new
        binding.pry
        @user = current_user
        binding.pry
        @reservation = Reservation.new(params.require(:reservation).permit(:startday, :endday, :people, :totalprice, :totalday))
        binding.pry
        @room = Room.find(params[:id])
     end
    
    
    


end
