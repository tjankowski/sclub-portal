# -*- encoding : utf-8 -*-
class StaffTeam < ActiveRecord::Base
  belongs_to :staff
  belongs_to :team
end
