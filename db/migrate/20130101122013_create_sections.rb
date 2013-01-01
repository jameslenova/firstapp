class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :forum_id

      t.timestamps
    end

    add_index :sections, [:forum_id]
  end
end
