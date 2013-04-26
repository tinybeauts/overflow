class Vote < ActiveRecord::Base
  attr_accessible :up, :choice_id, :choice_type, :user_id

  belongs_to :user
  belongs_to :choice, :polymorphic => true
end
