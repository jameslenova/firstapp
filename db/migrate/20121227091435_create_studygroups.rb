class CreateStudygroups < ActiveRecord::Migration
  def change
    create_table :studygroups do |t|
      t.integer :subject_id
      t.integer :location_id
      t.timestamp :classtime
      t.string :day
      t.boolean :activated,:default => false

      t.timestamps
    end

    add_index :studygroups, [:subject_id, :created_at]
    add_index :studygroups, [:location_id, :created_at]
  end
end
