WedE::Application.routes.draw do

  authenticated :weddy do
    root :to => 'weddies#index'
  end
  authenticated :supplier do
    root :to => 'suppliers#index'
  end
  authenticated :user do
    root :to => 'users#index'
  end

  root to: 'static_pages#home'

  devise_for :users, :weddies, :suppliers
  resources :users, :weddies, :suppliers
  resources :requirements, only: [:create, :destroy,:update]

  root to: 'static_pages#home'

  match '/inicio',      to: 'static_pages#home'
  match '/acerca',      to: 'static_pages#about'
  match '/supplier_home',   to: 'static_pages#supplier_home'
  match '/contacto',    to: 'static_pages#contact'

  match '/add_requirement',   to: 'weddies#add_requirement'


  match ':name' => 'weddies#index', :as => 'weddy_home'


  match '/auth/:authorization/callback' => 'authorizations#create' 
  resources :services, :only => [:index, :create, :destroy]
end
