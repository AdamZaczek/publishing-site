Rails.application.routes.draw do
  resources :user_sessions
  resources :users
    resources :posts do
      resources :comments
  end
  
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  get 'about' => 'pages#about', :as => :about
  
  root "posts#index"

end
