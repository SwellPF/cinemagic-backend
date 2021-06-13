class GenreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
