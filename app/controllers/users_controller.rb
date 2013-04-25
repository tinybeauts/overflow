class UsersController < ApplicationController
  include UsersHelper
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

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
    if @user.update_attributes(params[:user])
      flash[:success] = "P-file effing updated yo!"
      sign_in @user
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "You killed him (and/or her)!"
    redirect_to root_path
  end

  private

    def signed_in_user 
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user 
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
