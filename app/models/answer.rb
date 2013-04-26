class Answer < ActiveRecord::Base
  attr_accessible :body

  belongs_to :user
  belongs_to :question
  
  has_many :responses, :as => :comment
  has_many :votes,     :as => :choice

  validates :body, :presence => true
end
