class Posts::PostCommentsController < ApplicationController
  before_action :set_post
  before_action :set_post_comment, only: [:edit, :update, :destroy]

  def create
    @post_comment = @post.post_comments.new(post_comment_params)
    if @post_comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, alert: 'Error creating comment.'
    end
  end

  def edit
  end

  def update
    if @post_comment.update(post_comment_params)
      redirect_to @post, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post_comment.destroy
    redirect_to @post, notice: 'Comment was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_post_comment
      @post_comment = @post.post_comments.find(params[:id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
