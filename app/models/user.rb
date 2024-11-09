class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: { receptionist: 0, doctor: 1 }

  def receptionist?
    role == 'receptionist'
  end

  def doctor?
    role == 'doctor'
  end
end
