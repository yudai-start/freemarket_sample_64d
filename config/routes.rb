Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root to: 'posts#index'

  resources :signup do
    collection do
      get :signup1
      get :signup2
      get :signup3
      get :signup4
      get :signup5
    end
  end

  resources :posts do
    collection do
      get :signout
      get :profile
      get :signout
      get :mypage
      get :confirm
      get :personal_info
      get :exhibit
      get :add_payments
      get :footer
      get :creditCard
    end
 end
end