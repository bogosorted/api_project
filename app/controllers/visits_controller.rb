class VisitsController < ApplicationController

  before_action :authenticate_user, only: [:show,:index,:create,:update,:destroy,:set_visit]
  before_action :set_visit, only: [:show, :update, :destroy]

  # GET /visits
  def index
    
    @visits = @user.visits

    render json: @visits
  end

  # GET /visits/0
  def show
    render json: @visit
  end

  # POST /visits
  def create

    @visit = Visit.new(visit_params)
    @visit.user = @user
    
    if @visit.save

      render json: @visit, status: :created
    else

      render json: @visit.errors, status: :unprocessable_entity

    end
    
  end


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
  def destroy  

    if(@visit)
    @visit.destroy 

    else
      render json: {error: "visit_id: '#{params[:id]}' does not exist in data base"},status: :bad_request
    end
  
  end

  private

    def visit_params
      params.require(:visit).permit(:date, :checkin_at, :checkout_at)
    end
end
