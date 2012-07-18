# -*- encoding : utf-8 -*-
class BroadcastMessagesController < ApplicationController
layout "site"
before_filter :check_administrator_role

  # POST /broadcast_messages
  # POST /broadcast_messages.xml
  def create
    @broadcast = LiveBroadcast.find(params[:live_broadcast_id])
    @broadcast_message = @broadcast.broadcast_messages.create!(params[:broadcast_message])
    @broadcast_message.initialize_minute

    respond_to do |format|
      if @broadcast_message.save
        flash[:notice] = 'Dodano nowy tekst.'
        format.html { redirect_to(@broadcast) }
        format.xml  { render :xml => @broadcast_message, :status => :created, :location => @broadcast_message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @broadcast_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /appearances/1/edit
  def edit
    @broadcast_message = BroadcastMessage.find(params[:id])
  end

  # PUT /appearances/1
  # PUT /appearances/1.xml
  def update
    @broadcast_message = BroadcastMessage.find(params[:id])

    respond_to do |format|
      if @broadcast_message.update_attributes(params[:broadcast_message])
        flash[:notice] = 'Zmieniono wiadomość.'
        format.html { redirect_to(@broadcast_message.live_broadcast) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appearance.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /broadcast_messages/1
  # DELETE /broadcast_messages/1.xml
  def destroy
    @broadcast_message = BroadcastMessage.find(params[:id])
    @broadcast = @broadcast_message.live_broadcast
    @broadcast_message.destroy

    respond_to do |format|
      format.html { redirect_to(@broadcast) }
      format.xml  { head :ok }
    end
  end
end
