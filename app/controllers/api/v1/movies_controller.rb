class Api::V1::MoviesController < ApplicationController
   # before_action :require_login


    def index      
        # if current_user
            # if params[:movie] && params[:movie][:genre_id].present? && params[:newreleases]
            #     movies = Movie.filter_by_genre(params[:movie][:genre_id]).recent_releases
            
            # elsif params[:movie] && params[:movie][:genre_id].present?
            #     movies = Movie.filter_by_genre(params[:movie][:genre_id])
            # elsif
            #     params[:newreleases] 
            #         movies = Movie.recent_releases
            # else
            #     movies = Movie.all
            # end
            movies = Movie.all
            render json: movies
        # else
        #     redirect_to '/'
        # end
    end
    
    def show
        # if current_user
            movie = Movie.find(params[:id])
            render json: movie
        # else
        #     redirect_to '/'
        # end 
    end

    def create
        movie = Movie.new(movie_params)
        binding.pry
        if movie.save
            render json: movie
        else
            render json: {error: 'Error creating movie.'}
        end
    end

    def update
        @movie = Movie.find_by(id: params[:id])
        if @movie.update(movie_params)
            redirect_to movie_path(@movie)
        else
            render 'edit'
        end
    end


private

    def movie_params
        params.require(:movie).permit(:title, :genre_id, :year_released, :description, :image_link)
    end
end

