class Question < ActiveRecord::Base
  attr_accessible :title, :body

  has_many :responses, :as => :comment
  has_many :votes,     :as => :choice
  has_many :answers
  belongs_to :user
end
