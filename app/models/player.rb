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

  after_commit :set_default_avatar, on: [:create]

  private

  def set_default_avatar
    return if photo.attached?

    photo.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar-default.svg')),
      filename: 'avatar-default.svg',
      content_type: 'image/svg'
    )
  end
end
