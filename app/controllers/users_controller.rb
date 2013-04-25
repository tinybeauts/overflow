class UsersController < ApplicationController
  include UsersHelper

  def index
    # @user = User.find_by_email(params[:email])
    # if @user.authenticate(@user.email, @user.password)
    #   @user
    # else 
    #   redirect_to :index
    # end
    # @user = User.new
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
    @user = User.find(params[:id])
  end

  def update
    
  end

  def destroy

  end

end
