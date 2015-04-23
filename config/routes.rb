Rails.application.routes.draw do

  get 'sessions/calories'
  get 'sessions/steps'
  get 'sessions/distance'
  get 'sessions/main'
  
  get 'login' => 'sessions#new'
  #post 'sessions' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  #get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'sessions#create', via: :get
  #match '/auth/failure', :to => 'sessions#failure', via: :get
  #get '/logout', :to => 'sessions#destroy'
  
  resources :user do
  resources :catbit do
	resources :data
	end
  end

  resource :sessions

  get '/settings' => 'settings#show'
  patch '/settings' => 'settings#update'
  
  resources :goals
	
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'

  
end
