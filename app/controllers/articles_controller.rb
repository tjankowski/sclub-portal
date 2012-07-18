# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController
  layout "site"
  before_filter :check_administrator_role, :only => [:new, :create, :edit, :update, :all]

  # GET /articles
  # GET /articles.xml
  def index
    @all_tags = Tag.search(params[:search_tag])
    @articles = Article.find_all_by_published true, :order => "created_at DESC"
    if params[:tag]
      @tag = Tag.find params[:tag], :order => 'counter DESC'
      @tag.visit
      @articles = Article.select_from_collection_by_tag(@articles, @tag.name)
    end
    @articles = @articles.paginate :page => params[:page], :per_page => 5
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
      format.js
    end
  end

  # GET /articles
  # GET /articles.xml
  def all
    @all_articles = Article.find :all, :order => "created_at DESC"
    @all_articles = @all_articles.paginate :page => params[:page], :per_page => 5
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles
  # GET /articles.xml
  def website
    @articles = []
    for article in (Article.find_all_by_published true, :order => "created_at DESC")
      if article.has_tag?('website') or article.has_tag?('serwis')
        @articles << article
      end
    end
    @articles = @articles.paginate :page => params[:page], :per_page => 5

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    @article.visit
    @comments= @article.comments.paginate :page => params[:page], :per_page => 5

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    @article.user = current_user

    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(@article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
end
