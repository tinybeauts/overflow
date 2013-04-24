class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses, :force => true do |t|
      t.string :body, :null => false
      t.references :comment, :polymorphic => true
      t.references :user
      t.timestamps
    end
  end
end
