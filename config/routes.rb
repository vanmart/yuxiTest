Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  devise_for :users

  root to: "home#index"

  get 'home/index'
  get 'home/welcome'

  post 'home/saveIncome'
  post 'home/saveExit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
