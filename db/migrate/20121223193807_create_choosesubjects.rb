class CreateChoosesubjects < ActiveRecord::Migration
  def change
    create_table :choosesubjects do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
    add_index :choosesubjects, :user_id
    add_index :choosesubjects, :subject_id
    add_index :choosesubjects, [:user_id, :subject_id], unique: true
  end
end
