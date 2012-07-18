# -*- encoding : utf-8 -*-
class GalleryContent < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :photo
end
