class Topic < ActiveRecord::Base
  attr_accessible :content, :forum_id, :ratingdown, :ratingup, :title, :user_id, :section_id

  has_many :messages, dependent: :destroy
  belongs_to :section
end
