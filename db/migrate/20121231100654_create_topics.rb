class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title , :default => ""
      t.integer :section_id
      t.string :content , :default => ""
      t.integer :user_id
      t.integer :ratingup , :default => 0
      t.integer :ratingdown , :default => 0

      t.timestamps
    end

    add_index :topics, [:section_id, :created_at]
  end
end
