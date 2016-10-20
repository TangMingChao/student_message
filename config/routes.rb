Rails.application.routes.draw do

  resources :students_forums do
  	member do
  		post 'upvote'
  	end

  	 resources :comments
  end

  resources :feedbacks
  resources :photos
  resources :students_infos
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'students_infos#index'
  root "home#index"
end
