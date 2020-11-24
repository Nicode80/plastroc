Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :organisations
  resources :materials do
    resources :instructions, only: [:create, :new, :edit, :destroy, :update]
  end
  resources :missions, only: [:index]
end
