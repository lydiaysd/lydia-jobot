Rails.application.routes.draw do
  get 'saved_jobs/new'
  get 'saved_jobs/create'
  get 'saved_jobs/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :jobs, except: [:update, :edit] do
    resources :saved_jobs, only: [:new, :create]
  end
  resources :saved_jobs, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
