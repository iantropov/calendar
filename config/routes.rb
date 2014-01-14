Calendar::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users do
    resources :events do
      get :calendar, :on => :collection
    end
  end
  resources :sessions
  get "secret" => "home#secret", :as => "secret"
  root :to => "home#index"
end
