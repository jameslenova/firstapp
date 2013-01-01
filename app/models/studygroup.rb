class Studygroup < ActiveRecord::Base
  attr_accessible :activated, :classtime, :location_id, :subject_id,:day, :forum_id

  belongs_to :location
  belongs_to :subject
  belongs_to :forum


  has_many :choosestudygroups , dependent: :destroy

  def makeforum
    self.forum_id=Forum.create.id
    ss=self.forum.sections.create(title: "discussion")
    topi=ss.topics.create(title: "discussion")

  end




  

end
