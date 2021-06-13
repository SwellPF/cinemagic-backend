class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :content, :user_id, :movie_id

  belongs_to :user
  belongs_to :movie
end
