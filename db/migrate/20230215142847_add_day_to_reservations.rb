class AddDayToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :startday, :date 
    add_column :reservations, :endday, :date 
    add_column :reservations, :totalday, :integer 
    add_column :reservations, :people, :integer 
    add_column :reservations, :totalplace, :integer 
  end
end
