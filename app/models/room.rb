class Room < ApplicationRecord
    mount_uploader :room_image, ImageUploader
    belongs_to :user,optional: true

    has_many :reservations_path
end
