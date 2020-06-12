class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def add_learned_word   
    respond_to do |format|   
      @word = Word.find_by(id: params[:word][:id])
      if !@word.nil?
        if current_user.words.include?(@word)
          if params[:word][:option] == "add"
            notice_message = 1
            format.js { render :action => "add_learnt_word_notice" }
            format.json { render :json => { status: "error", msg: "This word has already been in your list!" } }
          else
            current_user.words.delete(@word)
            format.js { }
            format.json { render :json => { status: :ok } }
          end
        else
          if params[:word][:option] == "add"
            current_user.words << @word
            @user_word = UsersWord.joins('users').where("user_id =?", current_user.id).where("word_id =?", @word.id).first
            @user_word.update_attributes(:learned => "true")
            format.js { }
            format.json { render :json => { status: :ok } }
          else
            notice_message = 2
            format.js { render :action => "add_learnt_word_notice" }
            render :json => { status: :error, msg: "Word is not in your list!" }
          end
        end
      else
        notice_message = 3
        format.js { render :action => "add_learnt_word_notice" }   
        render :json => { status: :error, msg: "Word does not exist!" }
      end
    end
  end

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.where(category_id: :id).first
      # @word = Word.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_params
      params.require(:word).permit(:diction, :mean, :category_id)
    end
end
