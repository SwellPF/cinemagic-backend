class WatchlistMovie < ApplicationRecord
    belongs_to :movie
    belongs_to :watchlist

    def new
    end

    def create
    end   

end
