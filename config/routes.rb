Rails.application.routes.draw do
  root to: 'tasks#index'
  devise_for :users
  resources :tasks, except: :show do
  end
end
