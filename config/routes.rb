Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  resources :articles

  root 'blogs#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
