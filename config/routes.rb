Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }

  root 'pages#index'
  resources :pages, only: :index do
    collection do
      get 'search'
    end
  end

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

  post 'nice/:id' => 'nices#create', as: 'create_nice'
  delete 'nice/:id' => 'nices#destroy', as: 'destroy_nice'
end
