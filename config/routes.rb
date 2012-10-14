Instafood::Application.routes.draw do

  get "checkout/show"

  resource :order, only: [:show, :create, :destroy], controller: :order, format: :json do
    resources :order_items, only: [:show, :create, :destroy, :update, :index], format: :json
  end

  resources :payments, only: [:create], format: :json

  resource :menu, only: [:show], controller: :menu
  resource :checkout, only: [:show], controller: :checkout

  resource :auth_check, only: [:show], controller: :auth_check

  resources :menu_items, except: [:edit, :new]

  devise_for :users, controllers: { omniauth_callbacks:  'users/omniauth_callbacks' }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  root :to => 'home#index'
end
