Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  devise_for :users

  resources :users, only: [:edit, :update]
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  
  # resources :users, only: [:show]
  
  resources :signup do
    collection do
      get :signup0
      get :signup1
      get :signup2
      get :signup3
      get :signup4
      get :signup5
    end
  end

  resources :posts do
    collection do
      get :logout
      get :profile
      get :signout
      get :confirm
      get :add_payments
      get :footer
    end
 end
end