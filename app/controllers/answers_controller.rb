class AnswersController < ApplicationController

  before_action :authenticate_user, only: [:create,:update,:destroy]
  before_action :set_answer, only: [:show, :update, :destroy]

  # GET /answers
  def index
    @answers = Question.find(params[:question_index]).answers

    render json: @answers
  end

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_index]

    @answer.answered_at = Time.now

    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:content, :formulary_id, :question_id, :visit_id, :answered_at)
    end
end
