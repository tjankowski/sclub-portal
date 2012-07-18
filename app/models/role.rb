# -*- encoding : utf-8 -*-
class Role < ActiveRecord::Base
  has_many :permissions
  has_many :users, :through => :permissions
end
