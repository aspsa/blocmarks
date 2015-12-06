# Blocmarks, 4. Receive Incoming Emails
class Bookmark < ActiveRecord::Base
  belongs_to :topic

  # Blocmarks, 8. Like and Unlike Bookmarks
  has_many :likes, dependent: :destroy
  
  def user
    topic.user
  end
end