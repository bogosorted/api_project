
class JsonWebTokens

    class << self

        def encode(user_id,user_email,key, exp = 24.hours.from_now)
            payload = {}
            payload[:sub] = user_id
            payload[:email] = user_email
            payload[:exp] = exp.to_i

            JWT.encode(payload,key)
        end
   
        def decode(token,key)

            body = JWT.decode(token,key)[0] 
            HashWithIndifferentAccess.new body

        rescue
           # "your token is not valid"
        end
        
    end
end