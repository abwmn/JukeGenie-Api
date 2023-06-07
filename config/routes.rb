Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api  do
    namespace :v1 do
      post '/playlists', to: 'playlists#create'
      get '/playlists', to: 'playlists#index'
      resources :tracks, only: %i[show new create update destroy]
      resources :users, only: %i[new create show update]
      resources :suggestions, only: %i[new create update]
      delete "/suggestions", to: "suggestions#destroy"
    end
  end

  get '/login', to: 'login#create'
  get "/auth/spotify/callback", to: 'users#show'
end
