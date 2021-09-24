require './app/services/user_authentication'

class ApplicationController < ActionController::API
    

    JWT_KEY = Rails.application.credentials.jwt_secret


    def authenticate_user()
  
        token = request.headers["HTTP_AUTHORIZATION"]
        
        begin
    
          payload = UserAuthentication::JsonWebTokens.decode(token,JWT_KEY)
          
          @user = User.find(payload[:sub])
          
        rescue JWT::DecodeError => e
          
          render json: { errors: e.message }, status: :unauthorized
          
        rescue StandardError => e
          
          render json: {errors: e.message }, status: 404
          
        end

    end
    
end
