Rails.application.routes.draw do

  root 'pages#index'

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-out', to: 'authentication#destroy'
  get 'sign-in', to: 'authentication#new'
  post 'sign-in', to: 'authentication#create'

  get '/tasks/today', to: 'tasks#today', as: :tasks_today

  resources :tasks, only: [:index, :show, :new, :create]
  resources :users, only: [:show]

end
