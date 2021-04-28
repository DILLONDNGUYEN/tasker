class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      
      t.belongs_to :creator, foreign_key: {to_table: :users}
      
      t.string :name
      

      t.timestamps
    end
  end
end
