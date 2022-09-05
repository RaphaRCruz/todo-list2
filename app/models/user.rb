class User < ApplicationRecord
  has_many :tasks
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  before_validation :capitalize

  def capitalize
    first_name.capitalize!
    last_name.capitalize!
  end
end
