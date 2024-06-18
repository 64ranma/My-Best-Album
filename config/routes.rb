Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'homes/about', to: 'homes#about', as: :about
  get 'posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch 'posts/:id' => 'posts#update', as: 'update_post'

  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy] do
    resource :good, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
