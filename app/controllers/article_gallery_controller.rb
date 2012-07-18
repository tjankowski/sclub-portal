# -*- encoding : utf-8 -*-
class ArticleGalleryController < ApplicationController
  layout "site"
  before_filter :check_administrator_role

  def index
    @article = Article.find(params[:id])
    @all_galleries = Gallery.find(:all)
  end

  def add
    @article = Article.find(params[:article_id])
    @gallery = Gallery.find(params[:id])
    unless @article.has_gallery?(@gallery)
      @article.galleries << @gallery
    end
    redirect_to :action => 'index', :id => @article
  end

  def remove
    @article = Article.find(params[:article_id])
    @gallery = Gallery.find(params[:id])
    if @article.has_gallery?(@gallery)
      @article.galleries.delete(@gallery)
    end
    redirect_to :action => 'index', :id => @article
  end

end
