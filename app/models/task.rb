class Task < ApplicationRecord
  belongs_to :mission

   validates :description, presence: true


   
end
