class Api::V1::WatchlistsController < ApplicationController
    # before_action :require_login
    
    def create
        @watchlist = Watchlist.new(watchlist_params)
        @watchlist.user = current_user
        if @watchlist.save
            render json: @watchlist
        else
            render json: {error: 'Error creating Watchlist.'}
        end
    end


    def show
        @watchlist = Watchlist.find(params[:id])
        render json: @watchlist
    end

    def add_to_watchlist  
        wl = WatchlistMovie.new(watchlist_id: params[:watchlist][:watchlist_id], movie_id: params[:watchlist][:movie_id])
        if wl.save
            render json: wl
        else
            render json: {error: "Unable to add to watchlist."}
        end
    end

    def edit
        @watchlist = Watchlist.find(params[:id])
      end

    private
    def watchlist_params
        params.require(:watchlist).permit(:name, :user_id, :watchlist_id, :movie_id)
    end

end
