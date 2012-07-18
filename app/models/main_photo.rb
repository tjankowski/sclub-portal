# -*- encoding : utf-8 -*-
class MainPhoto < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :photo
end
