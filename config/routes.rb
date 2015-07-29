Rails.application.routes.draw do
  
  devise_for :users


  resources :registered_applications



  get 'welcome/about'
  get 'welcome/index'

  root to: 'welcome#index'
end
