Rails.application.routes.draw do
  
  
  devise_for :users, :paths => 'users'

  resource :user do
    resources :photos do
   	  get 'personal'
    end
  end
  
  root 'photos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
end
