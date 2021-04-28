class CreateUserMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_missions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :mission, null: false, foreign_key: true
      t.integer :user_id
      t.integer :mission_id
      t.text :comment
      t.datetime :completed_at

      t.timestamps
    end
  end
end
