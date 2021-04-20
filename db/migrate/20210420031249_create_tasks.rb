class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :task do |t|
      t.belongs_to :mission, null: false, foreign_key: true
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
