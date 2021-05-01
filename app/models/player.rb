class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :results, dependent: :destroy
  has_many :trainings, through: :results
  has_one_attached :photo

  validates :name, :email, :encrypted_password, presence: true
  validates :email, format: { with: Devise.email_regexp }
end
