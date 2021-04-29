Rails.application.routes.draw do

  devise_for :users

  resources :customers
  resources :projects
  resources :tasks
  resources :task_logs, only: [:create, :new]
  root to: 'customers#index'
end
