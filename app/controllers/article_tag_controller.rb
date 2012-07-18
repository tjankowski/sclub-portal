# -*- encoding : utf-8 -*-
class ArticleTagController < ApplicationController
  layout "site"
  before_filter :check_administrator_role

  def index
    @article = Article.find(params[:id])
    @all_tags = Tag.find(:all)
  end

  def add
    @article = Article.find(params[:article_id])
    @tag = Tag.find(params[:id])
    unless @article.has_tag?(@tag.name)
      @article.tags << @tag
    end
    redirect_to :action => 'index', :id => @article
  end

  def remove
    @article = Article.find(params[:article_id])
    @tag = Tag.find(params[:id])
    if @article.has_tag?(@tag.name)
      @article.tags.delete(@tag)
    end
    redirect_to :action => 'index', :id => @article
  end

end
