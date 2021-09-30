class AnswersController < ApplicationController

  before_action :authenticate_user, only: [:create,:update,:destroy]
  before_action :set_answer, only: [:show, :update, :destroy]

  # GET /answers
  def index
    @answers = Question.all

    render json: @answers
  end
  

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create

    @answer = Answer.create(answer_params)
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

  def question_answers

      @question = Question.find(params[:question_index])
      @answers = @question.answers

      render json: @answers
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @question = Question.find[params[:question_index]]
      @answer = @question.answers.where(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:content, :formulary_id, :question_id, :visit_id, :answered_at)
    end
end
