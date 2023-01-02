Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  root to: 'homes#top'
  get '/about' => 'public/homes#about', as: 'about'
  get '/items/:id' => 'public/items#show', as: 'items'
  resources :items
  resources :cart_items


  get '/customers/information/:id/edit' => 'public/customers#edit', as: 'customers_information_edit'
  get '/customers/:id' => 'public/customers#show', as: 'customer'
  resources :customers



  post '/orders/confirm' => 'public/oders#confirm', as: 'orders_confirm'
  resources :orders
  resources :addresses


 namespace :admin do

  root to: 'homes#top'
  patch 'items/:id' => 'items#update', as: 'update_item'
  get 'items/:id' => 'items#show', as: 'items'
  resources :items

  get 'customers/:id/edit' => 'customers#edit', as: 'edit_customer'
  patch 'customers/:id' => 'customers#update', as: 'update_customer'
  resources :customers

  resources :orders do
  resources :order_detail
 end

end









  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
