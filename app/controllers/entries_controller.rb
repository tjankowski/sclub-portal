# -*- encoding : utf-8 -*-
class EntriesController < ApplicationController
  layout "site"
  before_filter :check_administrator_role

  # GET /entries
  # GET /entries.xml
  def index
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = Entry.new
    @seasons = Season.find :all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = Entry.new
    @season = Season.find(params[:entry][:season])
    @entry.team_official_name = params[:entry][:team_official_name]
    @entry.player_name = params[:entry][:player_name]
    @entry.season = @season
    respond_to do |format|
      if @entry.save
        flash[:notice] = 'Entry was successfully created.'
        format.html { redirect_to(@entry) }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render new_entry_path }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        flash[:notice] = 'Entry was successfully updated.'
        format.html { redirect_to(@entry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end
  
end
