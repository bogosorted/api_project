class VisitsController < ApplicationController

  before_action :authenticate_user, only: [:show,:index,:create,:update,:destroy,:set_visit]
  before_action :set_visit, only: [:show, :update, :destroy]

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

    @visit = Visit.new(visit_params)
    @visit.user = @user
    
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
  
  def set_visit
    
    @visit = @user.visits[params[:id].to_i]

  end
  # DELETE /visits/1
  def destroy
    @visit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def visit_params
      params.require(:visit).permit(:date, :checkin_at, :checkout_at)
    end
end
