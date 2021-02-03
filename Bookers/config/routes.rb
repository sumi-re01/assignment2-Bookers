Rails.application.routes.draw do
  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # routes :books
  get 'books/index', as: 'books'
  post 'books' => 'books#create'
  get 'books/show', as: 'book'
  get 'books/edit'
  patch 'books/:id' => 'books#update', as: 'update_book'
end
