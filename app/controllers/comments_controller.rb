class CommentsController < ApplicationController
    before_action :require_login
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :content))
        
        redirect_to user_post_path(@post)
    end
end
