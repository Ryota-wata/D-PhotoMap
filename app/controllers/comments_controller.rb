class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to quiz_path(@comment.quiz), success: t('.success')
    else
      redirect_to quiz_path(@comment.quiz), danger: t('.fail')
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    redirect_to quiz_path(@comment.quiz), success: t('.success')
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content).merge(quiz_id: params[:quiz_id])
  end
end
