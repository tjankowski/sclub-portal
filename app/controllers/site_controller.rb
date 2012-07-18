# -*- encoding : utf-8 -*-
class SiteController < ApplicationController
  
  def index
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
    redirect_to :controller => "articles"
  end

  def contact
  end

  def stadium
    @title = "Motobi Bystrzyca Kąty Wrocławskie"
  end

end
