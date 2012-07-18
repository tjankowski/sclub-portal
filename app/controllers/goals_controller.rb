# -*- encoding : utf-8 -*-
class GoalsController < ApplicationController
  layout "site"
  before_filter :check_administrator_role, :except => :show
  
  # GET /goals
  # GET /goals.xml
  def index
    @goals = Goal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.xml
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.xml
  def new
    @goal = Goal.new
    @appearance = Appearance.find(params[:appearance_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goal }
      format.js   { page.reload() }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.xml
  def create
    @appearance = Appearance.find(params[:appearance_id])
    @goal = @appearance.goals.create(params[:goal])
    @goal.player = @goal.appearance.player
    @goal.team = @goal.appearance.team

    respond_to do |format|
      if @goal.save
        flash[:notice] = 'Goal was successfully created.'
        format.html { redirect_to(@goal.appearance) }
        format.xml  { render :xml => @goal, :status => :created, :location => @goal }
        format.js   {}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.xml
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        flash[:notice] = 'Goal was successfully updated.'
        format.html { redirect_to(@goal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.xml
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to(goals_url) }
      format.xml  { head :ok }
    end
  end
end
