class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes, :force => true do |t|
      t.references :user
      t.references :choice, :polymorphic => true
      t.boolean    :up,   :null => false
      t.timestamps
    end
  end
end
