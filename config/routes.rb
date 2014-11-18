Rails.application.routes.draw do
  devise_for :users

  root 'blogs#index'
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :articles
  resources :users, only: [] do
    resources :blogs, only: [:new, :create, :edit, :destroy]
  end
  resources :blogs, only: [:show]
  resources :categories, only: [:new, :create]
  get  '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
