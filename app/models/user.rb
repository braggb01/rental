class User < ActiveRecord::Base
	belongs_to :account
	has_secure_password

	attr_accessible :email, :password, :password_confirmation, :account_id

	validates_uniqueness_of :email
end
