# Blocmarks, 8. Like and Unlike Bookmarks
class Like < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user
end
