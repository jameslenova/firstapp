class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content ,:default => ""
      t.integer :ratingplus 
      t.integer :ratingdown
      t.integer :user_id
      t.integer :message_id
      t.integer :topic_id

      t.timestamps
    end
    add_index :messages, [:topic_id, :created_at]
  end
end
