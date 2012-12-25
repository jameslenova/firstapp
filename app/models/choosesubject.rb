class Choosesubject < ActiveRecord::Base
  attr_accessible :subject_id

  
  belongs_to :user
  belongs_to :subject

  validates :user_id, presence: true
  validates :subject_id, presence: true
end
