class AddMinToStudygroups < ActiveRecord::Migration
  def change
  	add_column :studygroups, :min, :integer, :default => 5
  end
end
