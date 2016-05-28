class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build
  end

  def create
    @article = Article.find_by_id(params[:article_id])
    @comment = @article.comments.build(comment_param)
    @comment.save
    redirect_to article_path(@article)
  end

  def show
  end

  private
    def comment_param
      params.require(:comment).permit(:content, :article_id)
    end
end