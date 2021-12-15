# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   resource :users, only: [:create]
#   post "/api/v1/signup", to: "users#create"
#   post "/api/v1/login", to: "users#login"
#   get "/api/v1/auto_login", to: "users#auto_login"

#   # Routes for Event
#   resources :events
#   get "/api/v1/events", to: "events#index"
#   post "/api/v1/events", to: "events#create"
#   get "/api/v1/events/:id", to: "events#show"
#   put "/api/v1/events/:id", to: "events#update"
#   get "/api/v1/search", to: "events#search"

#   # Routes for Event registration
#   resources :registrations
#   post "/api/v1/registrations", to: "registrations#create"
#   get "/api/v1/registrations/:id", to: "registrations#show"
# end

Rails.application.routes.draw do
  resource :users, only: [:create, :login, :auto_login]
  resources :events
  resources :registrations

  namespace :api do
    namespace :v1 do
      post :signup, to: "users#create"
      post :login, to: "users#login"
      get :auto_login, to: "users#auto_login"

      resources :registrations, only: [:create, :show]
      # post :registrations, to: "registrations#create"
      
      resources :events, only: [:index, :create, :show, :update] do
        get :search, on: :collection
      end
    end
  end
end
