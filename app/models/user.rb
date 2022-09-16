class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  validates_presence_of :first_name, :last_name
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
