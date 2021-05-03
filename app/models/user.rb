class User < ApplicationRecord

  has_secure_password(validations: false)

  has_many :user_missions
  has_many :missions, through: :user_missions
  has_many :tasks, through: :missions
  has_many :created_missions, class_name: "Mission", foreign_key: :created_id


  #validations for user

  # validates :email, :username, :password, presence: true 
  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 2}, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "Can't contain blank spaces or symbols" }
  validates :password_confirmation, presence: true, on: :create
  validates :password, on: :create, confirmation: true, unless: ->(u){ u.password.blank? }


  def self.from_omniauth(auth)
     #binding.pry
        # where(email: auth.info.email).find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |t|
        where(email: auth.info.email).first_or_initialize do |t|
        t.email = auth['info']['email']
        pw = SecureRandom.hex(20)
        t.password = pw
        t.password_confirmation=pw
        t.username = auth['info']['name'].downcase.gsub(" ", "_")+rand(1..10).to_s
          # binding.pry

      end
    end

end
