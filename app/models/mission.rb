class Mission < ApplicationRecord

  
  belongs_to :creator, class_name: "User"

  has_many :tasks
  has_many :user_missions
  has_many :users, through: :user_missions

  validates :name, presence: true

  # accepts_nested_attributes_for :task
  
  scope :completed_missions, -> {where(completed: true)}

end
