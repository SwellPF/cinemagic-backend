class Api::V1::MoviesController < ApplicationController
   # before_action :require_login

    def new
        if current_user.admin
            @movie = Movie.new
        else
            redirect_to movies_path
        end
    end

    def index
    #    @mostcomments = Movie.most_commented
      
        if current_user
            if params[:movie] && params[:movie][:genre_id].present? && params[:newreleases]
                @movies = Movie.filter_by_genre(params[:movie][:genre_id]).recent_releases
            
            elsif params[:movie] && params[:movie][:genre_id].present?
                @movies = Movie.filter_by_genre(params[:movie][:genre_id])
            elsif
                params[:newreleases] 
                    @movies = Movie.recent_releases
            else
                @movies = Movie.all
            end
        else
            redirect_to '/'
        end
    end
    
    def show
        if current_user
            @movie = Movie.find_by(id: params[:id])
        else
            redirect_to '/'
        end
       
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to movie_path(@movie)
        else
            render 'new'
        end
    end

    def edit
        if current_user.admin
            @movie = Movie.find_by(id: params[:id])
        else
            redirect_to movies_path
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


end
