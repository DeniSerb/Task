
Rails.application.routes.draw do
  get 'goals/new'

  get 'sessions/new'

  get 'users/new'
  
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/goals',   to:  'goals#index'
  post   '/goals',   to:  'goals#create'
  delete '/goals',   to:  'goals#destroy'
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :goals do

    member do
      get 'complete'
      get 'active_again'
    end
  end
end
