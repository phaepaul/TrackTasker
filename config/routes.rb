Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home', id: 'home'
end
