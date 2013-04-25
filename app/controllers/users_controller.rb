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
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "P-file effing updated yo!"
      sign_in @user
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy

  end

end
