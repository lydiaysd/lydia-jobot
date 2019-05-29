Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/new', to: 'pages#new'

  resources :user_skill

  resources :jobs do
    resources :saved_jobs, only: [:new, :create]
  end
  resources :saved_jobs, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
