class CreateChooselocations < ActiveRecord::Migration
  def change
    create_table :chooselocations do |t|
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end

    add_index :chooselocations, :user_id
    add_index :chooselocations, :location_id
    add_index :chooselocations, [:user_id, :location_id], unique: true
  end
end
