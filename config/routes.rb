Rails.application.routes.draw do
root :to => "home#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/jams" => "jams#index"

  get "/jams/new" => "jams#new"
  post "/jams" => "jams#create"


  get "/jams/:id" => "jams#show"

  get "/jams/:id/edit" => "jams#edit"
  patch "/jams/:id/" => "jams#update"

end
