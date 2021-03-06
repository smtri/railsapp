require 'sidekiq/web'
Rails.application.routes.draw do

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :images
      end
    end
  end

  root 'welcome#index'
  mount Sidekiq::Web, at: "/sidekiq"
end
