Rails.application.routes.draw do

  resources :questions do

    resources :answers

  end


  resources :formularies do

    resources :questions do

      resources :answers

    end
  end



  
  #user authentication
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#login'

  #when user logged
  scope 'users' do

    get '/profile', to: 'users#show'
    delete '/delete_account' , to: 'users#destroy'
    patch '/edit_account' , to: 'users#update'

    resources :visits

    

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
