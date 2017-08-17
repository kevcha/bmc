Rails.application.routes.draw do
  devise_for :users

  resources :reports, only: :index

  root to: 'reports#index'
end
