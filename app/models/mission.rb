class Mission < ApplicationRecord

  belongs_to :user
  has_many :tasks
  has_many :user_missions
  has_many :missions, through: :user_missions

  validates :name, presence: true
  


end
