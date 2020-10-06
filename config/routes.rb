Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get "posts/top" => "posts#top"
  get "posts/map" =>"posts#map"
  resources :posts do
    resources :comments, only: %i(new show create edit update destroy)
    resources :likes, only: [:create]
  end
end
