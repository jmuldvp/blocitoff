Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  # resources :users, only: [:show]

  authenticated :user do
    root 'users/show', as: :authenticated_root
  end
  # get 'users/:id' => 'users#show', as: :user
  # get 'users/:id', to: 'users#show'

  get 'welcome/index'

  get 'welcome/about'
  # get 'about' => 'welcome#about'  #cp 31

  get 'welcome/contact'

  root 'welcome#index'

  # root 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
