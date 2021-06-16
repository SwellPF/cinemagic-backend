class Api::V1::CommentsController < ApplicationController
    # before_action :require_login
  
    def create
     # binding.pry
      @movie = Movie.find_by(id: params[:movie_id])
      @comment = @movie.comments.new(movie_id: params[:movie_id], user_id: params[:user_id], content: params[:content])
      
      if @comment.save
          render json: @comment
      else
          render json: {error: "Error creating comment or comment cannot be blank."}
      end
    end

    def index
        if params[:movie_id]
          @movie = Movie.find(params[:movie_id])
          if @movie.nil?
            render json: {error: "Movie not found"}
          else
            @comments = @movie.comments
            render json: @comments
          end
        end
      end
         

    def show
        if params[:movie_id]
            @movie = Movie.find_by(id: params[:movie_id])
            @comment = @movie.comments.find_by(id: params[:id])
            if @comment.nil?
              render json: {error: "Comment not found"}
            end
        else
            @comment = Comment.find(params[:id])
            render json: @comment
        end
    end
    
    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
    
        if @comment.save
          render json: @comment
        else
          render json: {error: 'Error updating comment.'}
        end
    end

    def destroy
      @comment = Comment.find(params["id"])
      @movie = Movie.find(@comment.movie_id)
      if @comment.destroy
        render json: @movie
      else
        render json: {error: 'Unable to delete comment'}
      end
    end



    private

    def comment_params
        params.require(:comment).permit(:content, :movie_id, :user_id)
    end
end