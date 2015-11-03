# Blocmarks, 4. Receive Incoming Emails
class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks
end