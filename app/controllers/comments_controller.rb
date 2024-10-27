class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.new(params[:comment].permit(:name, :body, :post_id))

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to @comment.post, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment.post }
      else
        format.html { render @comment.post, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
