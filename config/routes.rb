Rails.application.routes.draw do
  # resources :minutes
  get 'minutes', to: 'minutes#index'
  post 'minutes', to: 'minutes#create'
  get 'minutes/new', to: 'minutes#new', as: 'new_minute'
  get 'minutes/resume', to: 'minutes#resume', as: 'resume_minute'
  get 'minutes/:id/edit', to: 'minutes#edit', as: 'edit_minute'
  get 'minutes/:id', to: 'minutes#show', as: 'minute'
  patch 'minutes/:id', to: 'minutes#update'
  put 'minutes/:id', to: 'minutes#update'
  delete 'minutes/:id', to: 'minutes#destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end

