class User < ActiveRecord::Base

	has_many :meetupsearches
	has_many :receipients, :through => :meetupsearches
	has_many :inverse_meetupsearches, :class_name => "meetup_searches", :friend_key => "receipient_id"
	has_many :inverse_receivers, :through => :inverse_meetupsearches, :source => :user


	has_many :meetings
	has_many :receivers, :through => :meetings
	has_many :inverse_meetings, :class_name => "Meeting", :foreign_key => "receiver_id"
	has_many :inverse_receivers, :through => :inverse_meetings, :source => :user

	has_many :friendships
  	has_many :friends, :through => :friendships
  	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  	has_many :inverse_friends, :through => :inverse_friendships, :source => :user

	has_attached_file :image, :styles => { small: "64x64", med: "100x100", large: "200x200" }, :default_url=>"robot.png"
      	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable,
	:omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.firstname = auth.info.first_name
			user.lastname = auth.info.last_name
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.image = auth.info.image
		end
	end
	
end
