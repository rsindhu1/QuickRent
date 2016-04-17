Rails.application.routes.draw do
  devise_for :users
  match ':controller(/:action)', :via => :get
  match '/aboutus' => 'houses#aboutus', :via => :get
  match '/welcome' => 'houses#welcome', :via => :get

  root 'houses#welcome'

 #devise_for :users
 
 resources :houses do
   resources :reviews
  end

end
