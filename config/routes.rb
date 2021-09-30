Rails.application.routes.draw do
  
  #when user have the token in https header
  scope 'users' do
    
    get '/profile', to: 'users#show'
    delete '/delete_account' , to: 'users#destroy'
    patch '/edit_account' , to: 'users#update'
    
    resources :visits
  end
  #user authentication
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#login'
  
  #formularies

  resources :formularies, param: 'index' do
    resources :questions , only: [:index]
  end

  resources :questions, param: 'index' do
    resources :answers, only:[:update,:show,:destroy]
    get '/answers' , to: 'answers#question_answers'
  end
  scope 'questions' do
  
    resources :answers, only:[:index,:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
