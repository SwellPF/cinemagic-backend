class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :content, :user_id, :movie_id
end
