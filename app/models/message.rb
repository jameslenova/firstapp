class Message < ActiveRecord::Base
  attr_accessible :content, :message_id, :ratingdown, :user_id, :topic_id
  belongs_to :topic
  belongs_to :user
end
