class ResponsesController < ApplicationController

  def index

  end

  def create
    @response = Response.new(params[:response])
    if @response.save
      if params[:question_id]
        @question = Question.find(params[:question_id])
        @question.responses << @response
        flash[:success] = "Your question comment was saved!"
        redirect_to @question
      elsif params[:answer_id] 
        @answer = Answer.find(params[:answer_id])
        @answer.responses << @response
        flash[:success] = "Your answer comment was saved!"

        redirect_to Question.find(@answer.question_id)
      end
      current_user.responses << @response
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
