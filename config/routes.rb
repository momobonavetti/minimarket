Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories
  resources :brands

  resources :products do
    collection do
      get :store
    end
  end

  get 'administrators', to: 'administrators#index'
  get 'toggle_admin', to: 'administrators#toggle_admin'
  # get 'add_admin', to: 'administrators#add_admin'
  # get 'remove_admin', to: 'administrators#remove_admin'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#store'
end
