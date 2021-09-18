Rails.application.routes.draw do
  resources :visits 
  resources :users, only: [:index,:show,:update,:destroy]

  post '/sign_up', to: 'users#create'
  post '/login', to: 'session#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
