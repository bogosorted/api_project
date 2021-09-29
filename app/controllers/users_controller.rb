
class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show,:update,:destroy]

  # GET /users/profile
  def show
    
    render json: @user 
    
  end
  
  # POST /sign_up
  def create

    @user = User.new(user_params)
    
    if @user.save

      render json: @user, status: :created

    else

      render json: @user.errors, status: :unprocessable_entity

    end

  end
  
  # PATCH/PUT /users/
  def update

    if @user.update(user_params)

      render json: @user

    else

      render json: @user.errors, status: :unprocessable_entity

    end

  end
  
  
  # DELETE /users/1
  def destroy
    @user.destroy
    render head: :ok
  end
  

  
  def login
  
    begin
  
      render json: UserAuthentication::Session.create(params);
  
    rescue StandardError => e
  
      render json: { errors: e.message }, status: :unauthorized
  
    end
    
  end

  private
  
  # Only allow a list of trusted parameters through.
  def user_params

    params.require(:user).permit(:nick_name,:password, :email, :cpf)

  end

end
