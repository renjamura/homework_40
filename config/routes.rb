Rails.application.routes.draw do
  
  
  devise_for :users, :paths => 'users'

  resource :user do
  	get '/:id'=>'users#show', as: 'personal'
    resources :photos
  end
  
  root 'photos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
end
