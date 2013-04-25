class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes

  validates_presence_of :email, :first_name 
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def gravatar_url
    Gravatar.new(email).url
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
