Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :tweets
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
