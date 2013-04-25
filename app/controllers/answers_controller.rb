class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])
    if @answer.save
      flash[:success] = "Good answer"
      @question.answers << @answer
      current_user.answers << @answer
      redirect_to @question
    else
      flash[:error] = "not quite dummy"
      redirect_to @question
    end
  end
  
  def new
    @answer = Answer.new
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
