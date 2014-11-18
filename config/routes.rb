Rails.application.routes.draw do
  devise_for :users

  # resources :users do
  #   resources :blogs, only: [:new, :create, :destroy, :update, :show]
  # end
  # resources :blogs do
  #   resources :articles, only: [:create, :destroy, :new]
  # end
  root 'blogs#index'
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :blogs
  resources :articles
end
