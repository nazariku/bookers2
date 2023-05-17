Rails.application.routes.draw do
  get 'books/new'
  get 'books' => 'books#index', as: 'index_book'
  get 'books/:id' => 'books#show', as: 'book'#as:オプション「'books#show'の設定を、bookとして利用できる」
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  post 'books' => 'books#create'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
