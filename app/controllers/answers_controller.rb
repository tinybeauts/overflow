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
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end
  
  def show
    @question = Question.find(params[:question_id])
    redirect_to @question
  end
  
  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])

    if @answer.update_attributes(params[:answer])
      flash[:success] = "Your answer was updated!"
      redirect_to @question
    else
      flash[:error] = "you suck"
      redirect_to edit_question_answer_path(@question, @answer)
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    Answer.find(params[:id]).destroy
    flash[:success] = "BOOM"
    redirect_to @question
  end
end
