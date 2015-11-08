class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #
  # Blocmarks - User Sign Up feature. Add the Devise 'confimable' moduule.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  # Blocmarks, 4. Receive Incoming Emails
  has_many :topics
end