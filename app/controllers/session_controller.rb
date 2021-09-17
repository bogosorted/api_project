
class SessionController < ApplicationController

    JWT_KEY = Rails.application.credentials.jwt_secret
    def require_jwt
        token = request.headers["HTTP_AUTHORIZATION"]
        if !token
          head :forbidden
        end
        if !valid_token(token)
          head :forbidden
        end
    end
    #post 
    def login

        @user = User.find_by(nick_name: params[:nick_name])

        if(@user && @user.authenticate(params[:password]))

            encoded = {auth_token: JsonWebTokens.encode(@user.id,@user.email,JWT_KEY)}

            render json: encoded

        else
          render json: error = {login: "Invalid credentials"}
        end
       
    end
    
end
