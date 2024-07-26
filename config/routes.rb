Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  
  devise_for :users
  root to: "homes#top"
  get 'homes/about', to: 'homes#about', as: :about

  resources :posts do
    resource :good, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :destroy]
  end
end
