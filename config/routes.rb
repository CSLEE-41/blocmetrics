Rails.application.routes.draw do
  
  devise_for :users
  resources :registered_applications

  namespace :api, defaults: {format: :json} do
    match 'events', to: 'events#options', via: [:options]
    resources :events, only: [:create]
  end



  get 'welcome/about'
  get 'welcome/index'

  root to: 'welcome#index'
end
