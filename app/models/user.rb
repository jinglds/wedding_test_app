class User < ActiveRecord::Base
	acts_as_voter
	has_many :favorites
	has_many :favorite_shops, through: :favorites, source: :favorited, source_type: 'Shop'
	has_many :shops, dependent: :destroy
	has_many :events, dependent: :destroy
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, 
  				format: { with: VALID_EMAIL_REGEX },
  				uniqueness: { case_sensitive: false }
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :address, presence: true
	validates :primary_contact, presence: true
	has_secure_password
	validates :password, length: { minimum: 6 }

	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

	def User.digest(token)
	    Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
	    self.remember_token = User.digest(User.new_remember_token)
	end
end