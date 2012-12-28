class Studygroup < ActiveRecord::Base
  attr_accessible :activated, :classtime, :location_id, :subject_id,:day

  belongs_to :location
  belongs_to :subject
  

end
