class User < ApplicationRecord

  has_secure_password

  has_many :user_missions
  has_many :missions, through: :user_missions
  has_many :tasks, through: :missions
  has_many :created_missions, class_name: "Mission", foreign_key: :created_id


  #validations for user

  validates :email, :username, :password, presence: true
  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 2}, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "Can't contain blank spaces or symbols" }
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, unless: ->(u){ u.password.blank? }


end
