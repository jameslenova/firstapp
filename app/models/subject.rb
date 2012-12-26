class Subject < ActiveRecord::Base
  attr_accessible :title
  validates :title,  presence: true, length: { maximum: 50 }

  has_many :choosesubjects, dependent: :destroy
  has_many :users, through: :choosesubjects, source: :user
 end

