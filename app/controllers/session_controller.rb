require './lib\tasks/json_web_tokens'

class SessionController < ApplicationController

    JWT_KEY = Rails.application.credentials.jwt_secret
    
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
