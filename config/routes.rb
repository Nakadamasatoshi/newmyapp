Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #top_controller
  get '/', to: 'top#index', as: 'index_top'

  #machine_controller
  get 'machines/index', to: 'machines#index', as: 'index_machine'
  get 'machines/new', to: 'machines#new', as: 'new_machine'
  post 'machines/new', to: 'machines#create', as: 'create_machine'
  get 'machines/edit/:id', to: 'machines#edit', as: 'edit_machine'
  post 'machines/edit/:id', to: 'machines#edit', as: 'update_machine'
  delete 'machines/destroy/:id', to: 'machines#destroy', as: 'destroy_machine'
end
