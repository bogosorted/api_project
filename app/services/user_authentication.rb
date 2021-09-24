module UserAuthentication
    JWT_KEY = Rails.application.credentials.jwt_secret
    
    class JsonWebTokens

        class << self

            def encode(user_id,user_email,key, exp = 24.hours.from_now)

                    #cannot have sensitive info

                    payload = {}
                    payload[:sub] = user_id
                    payload[:email] = user_email
                    payload[:exp] = exp.to_i

                    JWT.encode(payload,key)
                end

                def decode(token,key)

                    payload = JWT.decode(token,key)[0] 
                    HashWithIndifferentAccess.new payload

                end
                    
            end
        end

    class Session

            #post 
        class << self

            def create (params)

                @login_params = params
                @user = User.find_by(nick_name: login_params[:nick_name])
                
                if(@user && @user.authenticate(login_params[:password]))

                    encoded = {auth_token: JsonWebTokens.encode(@user.id,@user.email,JWT_KEY)}
                    
                else

                    raise "Invalid credentials"

                end   

            end

            def login_params
                @login_params.require(:user).permit(:nick_name,:password)
            end
        end
    end
end
