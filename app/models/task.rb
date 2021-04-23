class Task < ApplicationRecord

  belongs_to :missions

  validates :description, presence: true


end
