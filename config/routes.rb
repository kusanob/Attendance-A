Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    collection { post :import }
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'user_edit'
      patch 'user_update'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
    end
    collection do
      get 'working_now'
    end
    resources :attendances, only: :update
  end
  resources :baces
                          
end
