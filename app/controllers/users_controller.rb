class UsersController < ApplicationController
  include UsersHelper

  def index
    
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    
  end

  def show
    @user = current_user
  end

  def update
    
  end

  def destroy

  end

end
