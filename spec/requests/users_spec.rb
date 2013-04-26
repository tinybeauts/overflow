require 'spec_helper'


describe "Users" do

let(:user) { User.new(first_name: "first",
                        last_name: "last",
                        email: "test@example.com",
                        password: "123456",
                        password_confirmation: "123456")}
    
    it 'should be able to login with valid username and password' do 
      user.save

      visit signin_url

      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password
      click_button 'Sign In'
      page.should have_content "#{user.first_name}"
    end

    it 'should be able to signup with valid input' do

      visit signup_url

      fill_in 'user[first_name]', with: "test"
      fill_in 'user[last_name]', with: "last"
      fill_in 'user[email]', with: "example@email.com"
      fill_in 'user[password]', with: "123456"
      fill_in 'user[password_confirmation]', with: "123456"
      click_button 'submit'

      page.should have_content "test"
    end 

  end

