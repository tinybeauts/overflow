class ResponsesController < ApplicationController

  def index

  end

  def create
    @response = Response.new(params[:response])
    if @response.save
      if @question = Question.find(params[:question_id])
        @question.responses << @response
        redirect_to @question
      elsif @answer = Answer.find(params[:answer_id])
        @answer.responses << @response
        redirect_to @answer.question_id
      end
      current_user.responses << @response
      flash[:success] = "Your comment was saved!"
    else
      flash[:error] = "Bummer"
      redirect_to questions_path
    end
  end

  def new

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
