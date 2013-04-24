class UsersController < ApplicationController

  def index
    
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_path
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
    
  end

  def update
    
  end

  def destroy

  end

end
