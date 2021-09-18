require './lib\tasks/json_web_tokens'

class ApplicationController < ActionController::API

    JWT_KEY = Rails.application.credentials.jwt_secret
    
end
