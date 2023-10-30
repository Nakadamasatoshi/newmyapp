Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  #top_controller
  get '/', to: 'top#index', as: 'index_top'

  #mypage_controller
  get 'mypage/index', to: 'mypage#index', as: 'index_mypage'
  get 'mypage/new', to: 'mypage#new', as: 'new_mypage'
  post 'mypage/new', to: 'mypage#create', as: 'create_mypage'
  get 'mypage/edit/:id', to: 'mypage#edit', as: 'edit_mypage'
  post 'mypage/edit/:id', to: 'mypage#update', as: 'update_mypage'

  #machine_controller
  get 'machines/index', to: 'machines#index', as: 'index_machine'
  get 'machines/new', to: 'machines#new', as: 'new_machine'
  post 'machines/new', to: 'machines#create', as: 'create_machine'
  get 'machines/edit/:id', to: 'machines#edit', as: 'edit_machine'
  post 'machines/edit/:id', to: 'machines#update', as: 'update_machine'
  delete 'machines/destroy/:id', to: 'machines#destroy', as: 'destroy_machine'
  get 'machines/search', to: 'machines#search', as: 'search_machine'

  #Identification_controller
  get 'identification/new', to: 'identification#new', as: 'new_identification'
  post 'identification/new', to: 'identification#create', as: 'create_identification'
  get 'identification/edit/:id', to: 'identification#edit', as: 'edit_identification'
  post 'identification/edit/:id', to: 'identification#update', as: 'update_identification'

  
  # resources identifications:, only: [:new, :create, :edit, :update]
end
