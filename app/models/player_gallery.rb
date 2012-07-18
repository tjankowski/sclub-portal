# -*- encoding : utf-8 -*-
class PlayerGallery < ActiveRecord::Base
  belongs_to :player
  belongs_to :gallery
end
