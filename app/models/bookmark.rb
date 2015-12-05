# Blocmarks, 4. Receive Incoming Emails
class Bookmark < ActiveRecord::Base
  belongs_to :topic
  
  def user
    topic.user
  end
end