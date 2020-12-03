Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :organisations
  resources :campaigns, only: [ :new, :create ]

  resources :materials do
    resources :instructions, only: [ :create, :new ]
  end

  resources :campaigns, only: [ :index, :show, :edit, :update ] do
    resources :questions, only: [ :create ]
    resources :package, only: :create do
      resources :missions, only: [ :new, :create ]
    end
    collection do
      get :my_campaigns
    end
    member do
      get :dashboard
      patch :publish
      patch :pause
      get :duplicate
    end
  end

  resources :questions, only: [ :update, :destroy ] do
    member do
      patch :seen
    end
  end

  resources :instructions, only: [ :edit, :destroy, :update ]
  resources :users, only: [ :index, :show ]
  resources :missions, only: [ :index, :show, :update ] do
    collection do
      get :my_missions
    end
  end
end
