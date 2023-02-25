class Reservation < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :room,optional: true
  
  validates :startday, presence: true
  validates :endday, presence: true
end
