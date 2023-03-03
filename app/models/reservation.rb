class Reservation < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :room,optional: true
  
  validates :startday, {presence: true}
  validates :endday, presence: true
  validates :people, presence: true, numericality: true

  validate :end_check

    def end_check
        if startday.present? && endday.present? && startday >= endday
          errors.add(:endday, "は開始日より前の日付は選択できません。") 
        end
    end
end
