class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :genre_id, :year_released, :image_link
end
