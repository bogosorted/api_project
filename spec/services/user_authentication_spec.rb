require 'rails_helper'
include UserAuthentication


#JWT_KEY = Rails.application.credentials.jwt_secret
RSpec.describe UserAuthentication do
    
    JWT_KEY = Rails.application.credentials.jwt_secret

    describe 'JsonWebTokens' do

        it 'can encode and decode' do
            
            token = JsonWebTokens.encode(123321,"example@domain.com",JWT_KEY)
            
            payload = JsonWebTokens.decode(token,JWT_KEY)

            expect(payload[:sub]).to eql 123321
        end

    end
    describe 'Session' do

        it 'can login and return a valid token' do

            user = User.create(nick_name: 'fernando', password: '1234567', cpf: '08366148017', email: "example@domain.com")
            
            login_params = ActionController::Parameters.new({user:{nick_name:user.nick_name,password:user.password}})
           
            token = Session.create(login_params);

            payload = JsonWebTokens.decode(token[:auth_token],JWT_KEY)

            expect(payload[:email]).to eql "example@domain.com"
            
        end

    end

end
