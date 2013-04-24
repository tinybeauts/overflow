class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :force => true do |t|
      t.string :first_name,      :null => false
      t.string :last_name,       :null => false
      t.string :email,           :null => false, :unique => true
      t.string :password_digest, :null => false
      t.timestamps
    end
  end
end
