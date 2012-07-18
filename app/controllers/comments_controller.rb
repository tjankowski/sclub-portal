# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  layout "site"
  before_filter :login_required

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create!(params[:comment])
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.html { redirect_to @article } # index.html.erb
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @article } # index.html.erb
    end
  end

end
