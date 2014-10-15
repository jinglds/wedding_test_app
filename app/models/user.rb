class User < ActiveRecord::Base
	
	before_save { self.email = email.downcase }
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
end
