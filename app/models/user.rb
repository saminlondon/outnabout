class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
<<<<<<< HEAD


=======
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :bookings, dependent: :destroy
  has_many :venues, dependent: :destroy
  has_many :activities, through: :venues, dependent: :destroy
>>>>>>> c318a037f0f92d1701aedb272f3fd739d94cf8b7

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
