Rails.application.routes.draw do
  
  devise_for :users, controllers: { 
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :tweets do
    resources :comments, only: [:new, :create]
  end
  root 'tweets#index'
  post 'comments/:id/like', to: 'comments#like_comment', as: 'like_comment'
  post 'comments/:id/unlike', to: 'comments#unlike_comment', as: 'unlike_comment'
  post 'tweets/:id/like', to: 'tweets#like_tweet', as: 'like_tweet'
  post 'tweets/:id/unlike', to: 'tweets#unlike_tweet', as: 'unlike_tweet'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
