class AddMaxToStudygroups < ActiveRecord::Migration
  def change
  	add_column :studygroups, :max, :integer, :default => 10
  end
end
