class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, UserUploader

  validates :introduce, length: { maximum: 200 }
  attr_accessor :current_password

  has_many :rooms
end
