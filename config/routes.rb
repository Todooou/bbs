Rails.application.routes.draw do
  root to: "posts#new"
  get "posts/top" => "posts#top"
  get "posts/map" =>"posts#map"
  resources :posts do
    resources :comments, only: %i(new show create edit update destroy)
    resources :likes, only: [:create]
  end

  
end
