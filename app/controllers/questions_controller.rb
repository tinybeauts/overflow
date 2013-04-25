class QuestionsController < ApplicationController
  before_filter :correct_user_question, only: [:edit, :update, :destroy]
  before_filter :signed_in_user, only: [:new, :edit, :update, :destroy]
  
  def index
    # all the questions
    @questions = Question.all
  end

  def create
    # post to make a new question
    @question = Question.new(params[:question])
    if @question.save
      current_user.questions << @question
      flash[:success] = "Your question was successfully posted"
      redirect_to questions_path
    else
      flash[:error] = "For some reason your question sucks"
      render :new
    end
  end

  def new
    # form for making a new question
    @question = Question.new
  end

  def edit
    # edit existing question form (id)
    @question = Question.find(params[:id])
  end

  def show
    # show one question (id)
    @question = Question.find(params[:id])
  end

  def update
    # put to edit question (id) update attributes
    if @question.update_attributes(params[:question])
      flash[:success] = "Your question was updated"
      redirect_to @question
    else
      flash[:error] = "For some reason your question sucks"
      render :edit
    end
  end

  def destroy
    # delete to destroy existing question (id)
    Question.find(params[:id]).destroy
    flash[:success] = "Your question was destroyed"
    redirect_to root_path
  end

  private

    def correct_user_question 
      @question = Question.find(params[:id])
      redirect_to signin_path unless @question.user_id == current_user.id
    end
  
end
