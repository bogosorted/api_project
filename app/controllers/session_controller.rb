
class SessionController < ApplicationController

    JWT_KEY = Rails.application.credentials.jwt_secret
    #post 
    def login
        
        @user = User.find_by(nick_name: login_params[:nick_name])

        if(@user && @user.authenticate(login_params[:password]))

            encoded = {auth_token: JsonWebTokens.encode(@user.id,@user.email,JWT_KEY)}

            render json: encoded, status: :ok

        else

            render json: error = {login: "Invalid credentials"} , status: :unauthorized

        end   

    end

    def login_params
        params.require(:user).permit(:nick_name,:password)
    end

end
