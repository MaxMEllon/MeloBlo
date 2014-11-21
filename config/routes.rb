Rails.application.routes.draw do
  devise_for :users

  # root_path
  root 'blogs#index'

  # devise
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # user <---> blog
  resources :users, only: [] do
    resources :blogs, only: [:new, :create, :edit, :destroy]
  end
  # blog <---> articles
  resources :blogs, only: [:show] do
    resources :articles, only: [:new, :create, :destroy, :show]
  end

  # other
  resources :articles,   only: [:index, :edit, :update]
  resources :tag,        only: [:new, :create]
  resources :categories, only: [:new, :create, :show]

  # routing_error
  get  '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'

end
