Rails.application.routes.draw do
  
  get 'comments/new'
  get 'comments/create'
  root 'tweets#index'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :tweets do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
