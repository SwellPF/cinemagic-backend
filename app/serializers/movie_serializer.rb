class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :genre_id, :year_released, :image_link
  attribute :genre_name do |movie|
    movie.genre.name 
  end

  belongs_to :genre
  has_many :comments

  
  
end
