class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers, :force => true do |t|
      t.string :body, :null => false
      t.references :user
      t.references :question
      t.timestamps
    end
  end
end
