class Api::V1::MoviesController < ApplicationController
   # before_action :require_login


    def index      
        # if current_user
            # if params[:movie] && params[:movie][:genre_id].present? && params[:newreleases]
            #     movies = Movie.filter_by_genre(params[:movie][:genre_id]).recent_releases
            
            # if params[:movie] && params[:movie][:genre_id].present?
            #     movies = Movie.filter_by_genre(params[:movie][:genre_id])
            # elsif
            #     params[:newreleases] 
            #         movies = Movie.recent_releases
            # else
            #     movies = Movie.all
            # end
            movies = Movie.all
            render json: movies, include: ['comments'], methods: ['genre_name']
        # end
    end
    
    def show
        # if current_user
            movie = Movie.find(params[:id])
            render json: movie, include: ['comments'], methods: ['genre_name']
        # end 
    end

    def create
        movie = Movie.new(movie_params)
        movie.genre_id = movie.genre_id.to_i
        if movie.save
            render json: movie, include: ['comments'], methods: ['genre_name']
        else
            render json: {error: 'Error creating movie.'}
        end
    end

    def update
        # binding.pry
        movie = Movie.find_by(id: params[:id])
        if movie.update(movie_params)
            render json: movie, include: ['comments'], methods: ['genre_name']
        else
            render json: {error: 'Error updating movie.'}
        end
    end


private

    def movie_params
        params.require(:movie).permit(:id, :title, :genre_id, :year_released, :description, :image_link, :created_at, :updated_at)
    end
end

