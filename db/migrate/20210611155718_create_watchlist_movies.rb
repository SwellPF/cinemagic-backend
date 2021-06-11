class CreateWatchlistMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlist_movies do |t|
      t.integer :watchlist_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
