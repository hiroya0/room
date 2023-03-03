class Room < ApplicationRecord
    mount_uploader :room_image, ImageUploader
    belongs_to :user,optional: true
    has_many :reservations,dependent: :destroy
    
    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "id", "introduction", "name", "price", "room_image", "updated_at", "user_id"]
      end
      
      def self.ransackable_associations(auth_object = nil)
        ["reservations", "user"]
      end
      validates :price, numericality: true ,presence: true
      validates :name, presence: true
      validates :address, presence: true
      validates :introduction, presence: true
      
end
