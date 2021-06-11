class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :genre_id
      t.integer :year_released
      t.string :image_link

      t.timestamps
    end
  end
end
