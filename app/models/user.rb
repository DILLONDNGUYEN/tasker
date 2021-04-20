class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
#relationships
  has_secure_password

  has_many :mission
  has_many :task, through: :mission

  #validations for user
  validates :email, :username, :password, presence: true
  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 2}, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "Can't contain blank spaces or symbols" }
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, unless: ->(u){ u.password.blank? }


end
