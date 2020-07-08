Rails.application.routes.draw do


  devise_for :users
  get 'home/about'=> 'home#about'

  root 'home#top'

 resources :users, only: [:show, :edit, :update,:index]
 resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

