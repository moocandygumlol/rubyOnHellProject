Rails.application.routes.draw do
  get 'login' ,to: 'main#login'
  post 'main/create'
  get 'main/destroy'
  get 'main' ,to: 'main#home'
  get 'profile' ,to: 'main#profile'
  get 'my_market' ,to: 'main#market'
  get 'purchase_history' ,to: 'main#history'
  get 'sale_history' ,to: 'main#history'
  get 'my_inventory' ,to: 'main#inventory'
  get 'top_seller' ,to: 'main#topseller'
  post 'create_tables' ,to: 'main#create_tables'
  post 'buy' ,to: 'main#buy'
  resources :markets
  resources :inventories
  resources :items
  resources :users
  get 'changepassword', to: 'users#changePassword'
  post 'newpassword', to: 'users#newPassword'
  post 'updateinventory', to: 'markets#updateInventory'
  post 'addmarket', to: 'markets#addMarket'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
