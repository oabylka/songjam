Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "jams#index"

  get "/jams" => "jams#index"

  get "/jams/new" => "jams#new"
  post "/jams" => "jams#create"


  get "/jams/:id" => "jams#show"

  get "/jams/:id/edit" => "jams#edit"
  patch "/jams/:id/" => "jams#update"

end
