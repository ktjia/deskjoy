Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  get "/about", to: "pages#about"
  get "/dashboard", to: "users#dashboard"

  get '/contact', to: 'contact#new'
  post '/contact', to: 'contact#create'

  resources :profiles, only: [:show, :edit, :update]

  resources :spaces do
    resources :bookings, only: [:show, :create] do
      resources :payments, only: [:new, :create]
    end
    resources :tables, only: [:index, :create, :edit, :update, :new, :destroy]
  end
end



