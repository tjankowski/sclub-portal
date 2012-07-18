# -*- encoding : utf-8 -*-
class AppearancesController < ApplicationController
  layout "site"
  before_filter :check_administrator_role, :except => :show
  
  # GET /appearances
  # GET /appearances.xml
  def index
    @appearances = Appearance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appearances }
    end
  end

  # GET /appearances/1
  # GET /appearances/1.xml
  def show
    @appearance = Appearance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appearance }
    end
  end

  # GET /appearances/new
  # GET /appearances/new.xml
  def new
    @appearance = Appearance.new
    @match = Match.find(params[:match_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appearance }
      format.js { page.reload() }
    end
  end

  # GET /appearances/1/edit
  def edit
    @appearance = Appearance.find(params[:id])
  end

  # POST /appearances
  # POST /appearances.xml
  def create
    @match = Match.find(params[:match_id])
    @appearance = @match.appearances.create!
    @appearance.team = Team.find(params[:appearance][:team])
    @appearance.player_name = params[:appearance][:player_name]
    @appearance.number = params[:appearance][:number]
    @appearance.start = params[:appearance][:start]
    @appearance.end = params[:appearance][:end]
    @appearance.position = 100

    respond_to do |format|
      if @appearance.save
        flash[:notice] = 'Appearance was successfully created.'
        format.html { redirect_to(@appearance) }
        format.xml  { render :xml => @appearance, :status => :created, :location => @appearance }
        format.js   {}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appearance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appearances/1
  # PUT /appearances/1.xml
  def update
    @appearance = Appearance.find(params[:id])

    respond_to do |format|
      if @appearance.update_attributes(params[:appearance])
        flash[:notice] = 'Appearance was successfully updated.'
        format.html { redirect_to(@appearance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appearance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appearances/1
  # DELETE /appearances/1.xml
  def destroy
    @appearance = Appearance.find(params[:id])
    @match = @appearance.match
    @appearance.destroy

    respond_to do |format|
      format.html { redirect_to(@match) }
      format.xml  { head :ok }
    end
  end

  def sort
    if params[:home_squad]
      params[:home_squad].each_with_index do |id, index|
        Appearance.update_all(['position=?', index+1], ['id=?', id])
      end
    else
      params[:away_squad].each_with_index do |id, index|
        Appearance.update_all(['position=?', index+1], ['id=?', id])
      end
    end
    render :nothing => true
  end

  def rate
    @appearance = Appearance.find(params[:id])
    @appearance.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html "rate_form", ratings_for(@appearance, params.merge(:wrap => false, :force_static => true))
      #ratings_for(@appearance, params.merge(:wrap => false))
      page.visual_effect :highlight, "rate_form"
    end
  end

end
