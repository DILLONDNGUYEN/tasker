class User < ApplicationRecord

  has_secure_password

  has_many :missions
  has_many :tasks, through: :missions

  #validations for user
  validates :email, :username, :password, presence: true
  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 2}, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "Can't contain blank spaces or symbols" }
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, unless: ->(u){ u.password.blank? }


end
