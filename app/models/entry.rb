# -*- encoding : utf-8 -*-
class Entry < ActiveRecord::Base
  belongs_to :player
  belongs_to :season
  belongs_to :team

  validates_presence_of :player, :season, :team

  def player_name
    self.player.full_name if self.player
  end

  def player_name=(name)
    self.player = Player.find_by_full_name(name)
  end

  def team_official_name
    self.team.official_name if self.team
  end

  def team_official_name=(name)
    self.team = Team.find_by_official_name(name) unless name.blank?
  end
  
  end
