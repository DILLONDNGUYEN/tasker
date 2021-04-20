class CreateMission < ActiveRecord::Migration[6.0]
  def change
    create_table :mission do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.has_many :task
      t.datetime :created
      t.text :title
      t.string :status

      t.timestamps
    end
  end
end
