class AnswersController < ApplicationController
  def create
    params["answers"].each do |key, value|
      @answer = Answer.create(answer_params(value))
    end

    respond_to do |format|
      if @answer.save
        delete_written
        format.html { redirect_to assessment_url(@assessment), notice: "Assessment answers were successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_assessment_answer_params(answers)
    answers.permit(:user_id, :assessment_id, :question_id, :choosedOption_id)
  end
end
