Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :subs, only: [:new, :create] do
      resources :posts, only: [:new, :create, :show, :index]
    end
  end
  resource :session
  resources :subs, except: [:new, :create]
  # resources :posts, except: [:new, :create]

  # Defines the root path route ("/")
  # root "articles#index"
end
