class Response < ActiveRecord::Base
  attr_accessible :body

  belongs_to :comment, :polymorphic => true
  belongs_to :user

  has_many :votes, :as => :choice
end
