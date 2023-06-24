Rails.application.routes.draw do
  devise_for :users


  namespace :api do
    get '/users/:user_id/posts', to: 'posts#index'
    post '/comments', to: 'comments#create'
    get '/users/:user_id/posts/:post_id/comments', to: 'comments#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, skip: :all
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]

      resources :likes, only: [:new, :create]
    end
  end
end
