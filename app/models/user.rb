class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bills, dependent: :destroy

  def self.search(search)
    if search
      where('email LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
