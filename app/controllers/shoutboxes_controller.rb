# -*- encoding : utf-8 -*-
class ShoutboxesController < ApplicationController
  layout 'site'
  before_filter :login_required, :except => [:index, :update_shoutbox]

  # GET /shoutboxes
  # GET /shoutboxes.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shoutboxes }
    end
  end

  def update_shoutbox
    global_shoutbox
    
    respond_to do |format|
      format.js
    end
  end

  # POST /shoutboxes
  # POST /shoutboxes.xml
  def create
    @shoutbox = Shoutbox.new(params[:shoutbox])
    @shoutbox.user = current_user

    respond_to do |format|
      if @shoutbox.save
        format.html { redirect_to shoutboxes_path }
        format.xml  { render :xml => @shoutbox, :status => :created, :location => @shoutbox }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shoutbox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shoutboxes/1
  # DELETE /shoutboxes/1.xml
  def destroy
    @shoutbox = Shoutbox.find(params[:id])
    @shoutbox.destroy

    respond_to do |format|
      format.html { redirect_to shoutboxes_path }
    end
  end
end
