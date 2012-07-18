# -*- encoding : utf-8 -*-
class ManagemantController < ApplicationController
  before_filter :check_administrator_role
  
  def index
    @title = "Motobi Kąty Wrocławskie - Panel zarządzania"
    @article = Article.find :all
  end

end
