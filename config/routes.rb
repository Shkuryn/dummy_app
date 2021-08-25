Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path_names: { sign_in: 'signin', sign_up: 'signup', sign_out: 'logout' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products

  root to: 'static#index'
end
