Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
}
authenticated :user do
  root to: 'users#profile', as: :authenticated_root
end
  # Define root route to go to home#index
  root "home#index"

  # Devise routes for user authentication
  

  # User-specific routes
  resources :users, only: [:show, :edit, :update] 

  # Admin namespace
  namespace :admin do
    # Admin-specific user management routes
    resources :dashboard, only: [:index]
    resources :users, only: [:index, :edit, :update, :destroy] do
      put 'promote',on: :member
    end  
    
    # Admin dashboard route
    get 'dashboard', to: 'dashboard#index'
  end

  # Regular user dashboard route (non-admin users)
  get "dashboard", to: "dashboard#index"

  get 'profile', to: 'users#profile', as: 'profile'


  # Health check route (useful for checking if your app is up)
  get "up" => "rails/health"

  # Home route for general users (if needed)
  
end
