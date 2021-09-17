require './lib\tasks/json_web_tokens'

class ApplicationController < ActionController::API

    JWT_KEY = Rails.application.credentials.jwt_secret
    # def authorize_user_request
        

    #       @decoded = JsonWebToken.decode(header)
    #       @current_user = User.find(@decoded[:user_id])
    #     rescue ActiveRecord::RecordNotFound => e
    #       render json: { errors: e.message }, status: :unauthorized
    #     rescue JWT::DecodeError => e
    #       render json: { errors: e.message }, status: :unauthorized
    #     end
    #end

end
