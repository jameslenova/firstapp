class Forum < ActiveRecord::Base
  attr_accessible :content, :title


  has_many :sections, dependent: :destroy
end
