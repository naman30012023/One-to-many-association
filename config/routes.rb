Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/books/index' => 'book#index'
  get '/books/byAuthor' => 'book#displayByAuthor'
  get '/authors/index' => 'author#index'
  get '/authors/byBook' => 'author#searchAuthorByBookTitle'
  get '/books/page/:pageNo' => 'book#pagination'
  post '/books/add' => 'book#add'
  post '/authors/add' => 'author#add'
  put '/books/update' => 'book#update'
  delete 'books/delete' => 'book#deleteBookByTitle'
  delete '/authors/delete' => 'author#delete'
end
