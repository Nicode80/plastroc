Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :organisations do
    resources :campaigns, only: [ :new, :create ]
  end
  resources :materials do
    resources :instructions, only: [ :create, :new ]
  end

  resources :campaigns, only: [ :index, :show, :edit, :update ] do
    resources :package, only: :create do
      resources :missions, only: [ :create ]
    end
    collection do
      get :my_campaigns
    end
    member do
      get :dashboard
    end
  end

  resources :instructions, only: [ :edit, :destroy, :update ]
  resources :users, only: [ :index, :show ]
  resources :missions, only: [ :index ]
end
