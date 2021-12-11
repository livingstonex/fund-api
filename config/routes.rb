Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  # Routes for Event
  resources :events
  get "/events", to: "events#index"
  post "/events", to: "events#create"
  get "/events/:id", to: "events#show"
  put "/events/:id", to: "events#update"
  get "/search", to: "events#search"

  # Routes for Event registration
  resources :registrations
  post "/registrations", to: "registrations#create"
  get "/registrations/:id", to: "registrations#show"
end
