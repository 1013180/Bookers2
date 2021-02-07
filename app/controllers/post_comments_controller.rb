class PostCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @post_comment  = @book.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.save
    @new_post_comment = PostComment.new
    # redirect_to request.referer
  end



  def destroy
    @book = Book.find(params[:book_id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    @new_post_comment = PostComment.new
    # redirect_to request.referer
  end

   private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :book_id, :user_id)
  end
end
