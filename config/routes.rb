Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #top_controller
  get '/', to: 'top#index', as: 'index_top'

  #machine_controller
  get 'machines/new', to: 'machines#new', as: 'new_machine'
  post 'machines/new', to: 'machines#create', as: 'create_machine'
end
