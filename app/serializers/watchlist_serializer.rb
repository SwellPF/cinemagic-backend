class WatchlistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :user_id
end
