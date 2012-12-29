class Choosestudygroup < ActiveRecord::Base
  attr_accessible :studygroup_id, :user_id

  belongs_to :studygroup
  belongs_to :user

  
end
