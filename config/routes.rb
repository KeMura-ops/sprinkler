Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }

  root 'pages#index'

  resources :posts, only: [:index, :new, :create, :show, :destroy ] do
    resources :nices, only: [:create, :destroy]
    collection do
      get 'search'
    end
    get :timeline, on: :collection
  end

  resources :users do
    resource :follow
    resources :followings
    resources :followers
  end
end
