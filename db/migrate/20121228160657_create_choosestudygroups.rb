class CreateChoosestudygroups < ActiveRecord::Migration
  def change
    create_table :choosestudygroups do |t|
      t.integer :studygroup_id
      t.integer :user_id

      t.timestamps
    end


    add_index :choosestudygroups, :user_id
    add_index :choosestudygroups, :studygroup_id
    add_index :choosestudygroups, [:user_id, :studygroup_id], unique: true
  end
end
