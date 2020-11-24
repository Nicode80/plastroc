Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :organisations do
    resources :campaigns, only: [ :new, :create ]
  end

  resources :campaigns, only: [ :index, :edit, :update, :delete ]

end
