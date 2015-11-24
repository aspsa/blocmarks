# Blocmarks, 4. Receive Incoming Emails
class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks
  
  validates :title, presence: true, length: { minimum: 1 }
end