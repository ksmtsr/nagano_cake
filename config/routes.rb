Rails.application.routes.draw do
  namespace :admin do
  get 'homes/top'
  end
  get 'homes/top'
  # 会員側のルーティング設定
  get 'items' => 'public/items#index'
  # 管理者側のルーティング設定
    namespace :admin do
    resources :items
  end

  get 'items/:id/edit' => 'items#edit', as: 'edit_item'
  patch 'items/:id' => 'items#update', as: 'update_item'


devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
