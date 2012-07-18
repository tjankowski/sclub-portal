# -*- encoding : utf-8 -*-
class Staff < ActiveRecord::Base
  has_many :staff_team, :dependent => :destroy
  has_many :teams, :through => :staff_team

  def full_name
    "#{firstname} #{lastname}"
  end

  def has_team?(team)
    self.teams.find_by_id(team) ? true : false
  end
  
end
