class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:index,:create,:update,:destroy]

  # GET /visits
  def index
    @visits = Visit.all
    render json: @visits
  end

  # GET /visits/1
  def show
    render json: @visit
  end

  # POST /visits
  def create

    begin

      @visit = Visit.new(visit_params)

    rescue StandardError => e
      
      render json: {errors: e.message}, status: 404
      return;

    end

    @visit.user = @user

    if @visit.date.to_time <= Time.now.to_time
      render json:


    if @visit.save

      render json: @visit, status: :created, location: @visit
    else

      render json: @visit.errors, status: :unprocessable_entity

    end
    
  end

  # PATCH/PUT /visits/1
  def update
    if @visit.update(visit_params)
      render json: @visit
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visits/1
  def destroy
    @visit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visit_params
      params.require(:visit).permit(:date, :status, :user_id, :checkin_at, :checkout_at)
    end
end
