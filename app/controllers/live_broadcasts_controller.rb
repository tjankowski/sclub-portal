# -*- encoding : utf-8 -*-
class LiveBroadcastsController < ApplicationController
  layout "site"
  before_filter :check_administrator_role, :except => :show
  
  # GET /live_broadcasts
  # GET /live_broadcasts.xml
  def index
    @live_broadcasts = LiveBroadcast.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @live_broadcasts }
    end
  end

  # GET /live_broadcasts/1
  # GET /live_broadcasts/1.xml
  def show
    @live_broadcast = LiveBroadcast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @live_broadcast }
      format.js
    end
  end

  def start_next_status
    @live_broadcast = LiveBroadcast.find(params[:id])
    @live_broadcast.start_next_status

    respond_to do |format|
      if @live_broadcast.save
        flash[:notice] = 'Następy krok.'
        format.html { redirect_to(@live_broadcast) }
        format.js
      else
        flash[:notice] = 'Wystąpił błąd.'
        format.html { redirect_to(@live_broadcast) }
      end
    end
  end

  def next_status
    @live_broadcast = LiveBroadcast.find(params[:id])
    @live_broadcast.next_status
    
    respond_to do |format|
      if @live_broadcast.save
        flash[:notice] = 'Następy krok.'
        format.html { redirect_to(@live_broadcast) }
        format.js
      else
        flash[:notice] = 'Wystąpił błąd.'
        format.html { redirect_to(@live_broadcast) }
      end
    end
  end

  def last_status
    @live_broadcast = LiveBroadcast.find(params[:id])
    @live_broadcast.last_status

    respond_to do |format|
      if @live_broadcast.save
        flash[:notice] = 'Confnięto krok.'
        format.html { redirect_to(@live_broadcast) }
        format.js
      else
        flash[:notice] = 'Wystąpił błąd.'
        format.html { redirect_to(@live_broadcast) }
      end
    end
  end

  #Początek pierwszej połowy meczu
  def first_half_start
    @live_broadcast = LiveBroadcast.find(params[:id])
    @live_broadcast.start_first_half

    respond_to do |format|
      if @live_broadcast.save
        flash[:notice] = 'Początek pierwszej połowy.'
        format.html { redirect_to(@live_broadcast) }
        format.js
      else
        flash[:notice] = 'Wystąpił błąd.'
        format.html { redirect_to(@live_broadcast) }
      end
    end
  end

  #Początek drugiej połowy meczu
  def second_half_start
    @live_broadcast = LiveBroadcast.find(params[:id])
    @live_broadcast.start_second_half
    
    respond_to do |format|
      if @live_broadcast.save
        flash[:notice] = 'Początek drugiej połowy.'
        format.html { redirect_to(@live_broadcast) }
        format.js
      else
        flash[:notice] = 'Wystąpił błąd.'
        format.html { redirect_to(@live_broadcast) }
      end
    end
  end

  def reset_start
    @live_broadcast = LiveBroadcast.find(params[:id])
    @live_broadcast.reset_status

    respond_to do |format|
      if @live_broadcast.save
        flash[:notice] = 'Zresetowano zegar.'
        format.html { redirect_to(@live_broadcast) }
        format.js
      else
        flash[:notice] = 'Wystąpił błąd.'
        format.html { redirect_to(@live_broadcast) }
      end
    end
  end

  # POST /live_broadcasts
  # POST /live_broadcasts.xml
  def create
    @match = Match.find params[:match_id]
    
    respond_to do |format|
      if @match.has_live_broadcast?
        @live_broadcast = @match.live_broadcast
        flash[:notice] = 'Relacja live została utworzona wcześniej.'
        format.html { redirect_to(@live_broadcast) }
        format.xml  { render :xml => @live_broadcast, :status => :created, :location => @live_broadcast }
      else
        @live_broadcast = LiveBroadcast.new
        @live_broadcast.match = @match
        @live_broadcast.reset_status
        
        if @live_broadcast.save
          flash[:notice] = 'Relacja live pomyślnie utworzona.'
          format.html { redirect_to(@live_broadcast) }
          format.xml  { render :xml => @live_broadcast, :status => :created, :location => @live_broadcast }
        else
          format.html { redirect_to(@match) }
          format.xml  { render :xml => @live_broadcast.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /live_broadcasts/1
  # DELETE /live_broadcasts/1.xml
  def destroy
    @live_broadcast = LiveBroadcast.find(params[:id])
    @live_broadcast.destroy

    respond_to do |format|
      format.html { redirect_to(live_broadcasts_url) }
      format.xml  { head :ok }
    end
  end
end
