class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #
  # Blocmarks - User Sign Up feature. Add the Devise 'confimable' moduule.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  # Blocmarks, 4. Receive Incoming Emails
  has_many :topics
  
  # Can create, modify and delete any topic or bookmark
  def admin?
    role == 'admin'
  end
  
  # Can delete other users' topics and bookmarks, but cannot edit them
  def moderator?
    role == 'moderator'
  end
  
  # Can create/edit/delete one's own topics and bookmarks only
  def member?
    role == 'member'
  end
  
  # Can read only any topic and bookmark
  def guest?
    role == 'guest'
  end
end