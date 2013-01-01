class Section < ActiveRecord::Base
  attr_accessible :forum_id, :title, :forum_id

  has_many :topics, dependent: :destroy
  belongs_to :forum
end
