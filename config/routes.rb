Rails.application.routes.draw do
  resources :visits
  resources :users
  post '/login', to: 'session#login'
  get '/login', to: 'session#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
