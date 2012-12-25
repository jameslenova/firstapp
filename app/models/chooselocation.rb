class Chooselocation < ActiveRecord::Base
  attr_accessible :location_id

  
  belongs_to :user
  belongs_to :location

  validates :user_id, presence: true
  validates :location_id, presence: true
end
