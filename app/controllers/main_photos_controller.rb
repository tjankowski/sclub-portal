# -*- encoding : utf-8 -*-
class MainPhotosController < ApplicationController
  layout "site"
  before_filter :check_administrator_role

  def set
    @photo = Photo.find(params[:photo_id])
    @gallery = Gallery.find(params[:id]) 
    if (@gallery.has_photo?(@photo))
      if @gallery.has_main_photo?
        @main_photo = @gallery.main
        @main_photo.photo = @photo
      else
        @main_photo = MainPhoto.new
        @main_photo.photo = @photo
        @main_photo.gallery = @gallery
      end
        @main_photo.save
        @gallery.main = @main_photo
    end
    redirect_to @gallery
  end
  
end
