Rails.application.routes.draw do
root :to => "home#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/jams" => "jams#index"
  get "/jams/timeline", to: "jams#timeline"

  get "/jams/new" => "jams#new"
  post "/jams" => "jams#create"


  get "/jams/:id" => "jams#show"

  get "/jams/:id/edit" => "jams#edit"
  patch "/jams/:id/" => "jams#update"

  get "/songs", to: "songs#index"
  get "/songs/:id", to: "songs#show", as: 'song'

  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"

  get "/timeline", to: "jam_participants#index"
  post "/jam_participants" => "jam_participants#create"
  get "/jam_participants/:id" => "jam_participants#destroy"

  namespace :api do
    namespace :v1 do
      resources :jams
    end
  end

  namespace :api do
    namespace :v1 do
      resources :jam_participants
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

end
