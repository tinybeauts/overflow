class User < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email, :password

  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes

  has_secure_password

  validates_presence_of :email, :first_name 
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/
  validates_length_of :password, :in => 6..20

  def gravatar_url
    Gravatar.new(email).url
  end

end
