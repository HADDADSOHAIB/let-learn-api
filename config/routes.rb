Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :users, only: [:create]
      post 'login', to: 'login#create'
      delete 'signout', to: 'loging#destroy'
      put 'refresh', to: 'login#refresh'
      post 'signup', to: 'signup#create'
      get 'test', to: 'test#index'
      post 'test', to: 'test#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
