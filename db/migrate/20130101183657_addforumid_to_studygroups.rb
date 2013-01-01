class AddforumidToStudygroups < ActiveRecord::Migration
  def change
  	add_column :studygroups, :forum_id, :integer
  end
end
