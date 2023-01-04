Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


 scope module: :public do

  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  get '/items/:id' => 'items#show', as: 'items'
  resource :items
  resources :cart_items

  get '/customers/information/edit' => 'customers#edit', as: 'edit_customers'
  resource :customers



  post '/orders/confirm' => 'oders#confirm', as: 'orders_confirm'
  resources :orders
  resources :addresses

 end


 namespace :admin do

  root to: 'homes#top'
  patch 'items/:id' => 'items#update', as: 'update_item'

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
