class Vote < ActiveRecord::Base
  attr_accessible :up

  belongs_to :user
  belongs_to :choice, :polymorphic => true
end
