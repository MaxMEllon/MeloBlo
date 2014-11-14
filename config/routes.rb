Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  resources :articles

  root 'blogs#index'
end
