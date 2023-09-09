Rails.application.routes.draw do
  devise_for :users
# シェア機検索で追加
  root to: "posts#index"
  resources :posts do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
    resources :users, only: :show
  end
# ここまで
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  #top_controller
  get '/', to: 'top#index', as: 'index_top'

  #mypage_controller
  get 'mypage/index', to: 'mypage#index', as: 'index_mypage'

  #machine_controller
  get 'machines/index', to: 'machines#index', as: 'index_machine'
  get 'machines/new', to: 'machines#new', as: 'new_machine'
  post 'machines/new', to: 'machines#create', as: 'create_machine'
  get 'machines/edit/:id', to: 'machines#edit', as: 'edit_machine'
  post 'machines/edit/:id', to: 'machines#update', as: 'update_machine'
  delete 'machines/destroy/:id', to: 'machines#destroy', as: 'destroy_machine'
end
