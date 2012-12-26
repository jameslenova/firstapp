class Location < ActiveRecord::Base
  attr_accessible :title
  validates :title,  presence: true, length: { maximum: 50 }


  has_many :chooselocations, dependent: :destroy
  has_many :users, through: :chooselocations, source: :user
  
end
