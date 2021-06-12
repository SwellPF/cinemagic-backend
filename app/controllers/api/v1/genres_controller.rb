class Api::V1::GenresController < ApplicationController
    
    def index
        genres = Genre.all
        render json: genres
    end

    def create
        genre = Genre.new(genre_params)
        if genre.save
            render json: genre
        else
            render json: {error: 'Error creating genre.'}
        end
    end

    def show
        genre = Genre.find(params[:id])
        render json: genre
    end

    def edit
        genre = Genre.find(params[:id])
    end

    def update
        genre = Genre.find_by(id: params[:id])
        if genre.update(name: params['genre']['name'])
            genre.save
            render json: genre
        else
            render json: {error: 'Error updating genre.'}
        end
    end

private

    def genre_params
        params.require(:genre).permit(:name)
    end

end
