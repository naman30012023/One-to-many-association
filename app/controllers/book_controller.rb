class BookController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        books = Book.all
        render json: books
    end

    def add
        author = Author.find_by(name: params[:name])
        book = author.books.create(published_at: params[:published_at], title: params[:title], pages: params[:pages])
        render json: book
    end

    def deleteBookByTitle

        book = Book.find_by(title: params[:title])
        if(book)
            render json: book
            book.destroy
        else
            render text: 'Np book of same title found'
        end
    end

    def displayByAuthor
        author = Author.find_by(name: params[:name])
        if(author)
            books = Book.where(author_id: author.id)
            render json: books
        else
            render text: 'No such author found'
        end
    end

    def update
        book = Book.find_by(title: params[:title])
        book.title = params[:title] || book.title
        book.pages = params[:pages] || book.pages
        book.published_at = params[:published_at] || book.published_at
        book.author_id = params[:author_id] || book.author_id
        book.save
        render json: book
    end

    def pagination
        pageLimit = 2
        
        page = (params[:pageNo]).to_i 
        page=page -1
        books = Book.limit(pageLimit).offset(pageLimit*page)
        render json: books
    end
end


#convert all string to upper/lower case to check