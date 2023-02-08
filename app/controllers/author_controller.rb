class AuthorController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        authors = Author.all
        render json: authors
    end

    def add
       author = Author.create(name: params[:name])
        render json: author
    end

    def searchAuthorByBookTitle
        author = Author.find(Book.find_by(title: params[:title]).author_id)
        render json: author
    end

    def delete
        author = Author.find_by(name: params[:name])
        render json: author
        author.destroy
    end

end
