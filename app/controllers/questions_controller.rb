class QuestionsController < ApplicationController

  before_action :authenticate_user, only: [:create,:update,:destroy]
  before_action :set_question, only: [:show, :update, :destroy]

  def index

    if(params[:formulary_index])

      @formulary = Formulary.find(params[:formulary_index])

      if(@formulary)

        @questions = @formulary.questions

       end

    else

      @questions = Question.all

    end


    render json: @questions
  end


  def show
    render json: @question
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end


  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end
  def set_question_without_form
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      if(params[:formulary_index])
        @formulary = Formulary.find(params[:formulary_index])
        @question = @formulary.questions[params[:question_index]]
      else
        @question = Question.find(params[:index])
      end

    end
    

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question_name,:formulary_id)
    end
end
