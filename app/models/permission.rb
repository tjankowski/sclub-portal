# -*- encoding : utf-8 -*-
class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
