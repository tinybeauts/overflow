class User < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email, :password

  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes

  has_secure_password
end
