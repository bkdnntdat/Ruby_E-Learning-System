class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]

  def written
    @assessment_questions = Question.all
    @assessment_options = Option.all
    @empty_answers = []

    Question.all.each do
      @empty_answers << Answer.new
    end
  end

  def delete_written
    Answer.where(choosedOption_id: nil).delete_all
  end

  # GET /assessments
  # GET /assessments.json
  def index
    @assessments = Assessment.all
  end

  # GET /assessments/1
  # GET /assessments/1.json
  def show
  end

  # GET /assessments/new
  def new
    @assessment = Assessment.new
    @categories = Category.all
    @questions = Question.all
  end

  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments
  # POST /assessments.json
  def create
    # category_id = params[:assessment][:category_id]
    @assessment = Assessment.new(timeLimit: "10:00", category_id: 1)
    
    respond_to do |format|
      if @assessment.save
        ## Lay ngau nhien cac cau hoi ##
        @questions = Question.where("category_id =?", 1) # Lay cau hoi thuoc ve category user chon
                            .order("RAND()") # Lay ngau nhien
                            .first(20)  # 20 cau hoi
                            
        @assessment.questions << @questions

        format.html { redirect_to assessment_path(@assessment) }
        format.json { render :edit, status: :created, location: assessment_path(@assessment) }
        format.js {}
      end

      format.html { redirect_to root_url }
      format.json { render json: @assessment.errors, status: :unprocessable_entity }
      format.js {}
    end
  end

  # PATCH/PUT /assessments/1
  # PATCH/PUT /assessments/1.json
  def update
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to @assessment, notice: "Assessment was successfully updated." }
        format.json { render :show, status: :ok, location: @assessment }
      else
        format.html { render :edit }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1
  # DELETE /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: "Assessment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assessment
    @assessment = Assessment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assessment_params
    params.fetch(:assessment, {})
  end
end
