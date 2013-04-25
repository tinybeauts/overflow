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
      sign_in @user
      flash[:success] = "Welcome to overflow, where the flow is hot!"
      redirect_to @user
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
