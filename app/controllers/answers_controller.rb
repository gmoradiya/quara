class AnswersController < ApplicationController
  def new
  end

  def edit
  end

  def index
  end


  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to questions_path
    else
      render :new
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end
end
