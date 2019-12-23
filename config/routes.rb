Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'items#index'
  get '/auth/:provider/callback' => 'sns_credentials#create'
  
  resources :sns_credentials
  resources :items, only:[:index, :new, :create, :delete, :edit, :update, :show]
  resources :users, only: [:edit, :update] do
    collection do
      get :signout
      get :mypage
    end
  end

  resources :addresses, only: [:edit, :update]
  resources :cards, only: [:new, :show, :create, :destroy] do
    collection do
      get :registration
    end
  end

  resources :signup do
    collection do
      get :signup1
      get :signup2
      get :signup3
      get :signup4
      get :signup5
    end
  end

  resources :items do
    member do
      get :buy_confirm
      put :done_buy_confirm
    end
  end

end