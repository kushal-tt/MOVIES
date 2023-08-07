Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, :controllers => { :sessions => "users/sessions",
  registrations: 'users/registrations'}

  root to: 'movies#index'
  
  resources :movies, only: [:index, :show] do
    resources :ratings, only: [:create]
  end
   resources :user_reviews, only: [:index, :edit, :update, :destroy]
end

 

