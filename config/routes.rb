Rails.application.routes.draw do
  get 'login' ,to: 'main#login'
  post 'main/create'
  get 'main/destroy'
  get 'main' ,to: 'main#home'
  get 'profile' ,to: 'main#profile'
  get 'my_market' ,to: 'main#market'
  get 'purchase_history' ,to: 'main#phistory'
  get 'sale_history' ,to: 'main#shistory'
  get 'my_inventory' ,to: 'main#inventory'
  get 'top_seller' ,to: 'main#topseller'
  resources :markets
  resources :inventories
  resources :items
  resources :users
  get 'changepassword', to: 'users#changePassword'
  post 'newpassword', to: 'users#newPassword'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
