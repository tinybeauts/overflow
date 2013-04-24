class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions, :force => true do |t|
      t.string :title, :body, :null => false
      t.references :user
      t.timestamps
    end
  end
end
