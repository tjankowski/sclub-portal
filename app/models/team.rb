# -*- encoding : utf-8 -*-
class Team < ActiveRecord::Base
  belongs_to :club
  has_many :appearances, :dependent => :destroy
  has_many :goals, :dependent => :destroy
  has_many :cards, :dependent => :destroy
  has_many :entries, :dependent => :destroy
  has_many :staff_team, :dependent => :destroy
  has_many :staffs, :through => :staff_team
  has_many :seasons, :through => :entries
  has_many :players, :through => :entries
  has_many :last_entries, :through => :last_season
  has_many :actual_players, :through => :last_entries
  has_many :season_standings, :order => "position DESC", :dependent => :destroy

  validates_uniqueness_of :official_name, :message => "nie może się powtarzać"
  validates_presence_of :official_name, :message => "nie może być pusta"
  validates_presence_of :name, :message => "nie może być pusta."

  #Prztłumaczone nazwy pól
  HUMANIZED_ATTRIBUTES = {
    :name => "Nazwa",
    :official_name => "Nazwa oficialna",
  }

  #Tłumaczy nazwy pól
  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def club_name
    club.name if club
  end

  def club_name=(name)
    self.club = Club.find_or_create_by_name(name) unless name.blank?
  end

  def last_season
    self.seasons.last
  end

  def last_seasons(year)
    self.seasons.find_all :start_at.year >= year
  end

  def team_position(season)
    season.team_position(self)
  end

  def last_match
    @time = Time.now
    @matches = self.last_season.matches.find :all,:conditions => ['(team_id = ? OR rival_id = ?) AND match_start < ?', self, self, @time], :order => "match_start DESC"
    @matches.first
  end

  def next_match
    @time = Time.now
    @matches = self.last_season.matches.find :all,:conditions => ['(team_id = ? OR rival_id = ?) AND match_start > ?', self, self, @time], :order => "match_start ASC"
    @matches.first
  end

  def season_points(season)
    @season = Season.find(season)
    @win_home_matches = @season.matches.find :all, :conditions => ['team_id = ? AND home > away', self]
    @win_away_matches = @season.matches.find :all, :conditions => ['rival_id = ? AND home < away', self]
    @draw_home_matches = @season.matches.find :all, :conditions => ['team_id = ? AND home = away', self]
    @draw_away_matches = @season.matches.find :all, :conditions => ['rival_id = ? AND home = away', self]
    @points = @win_home_matches.length*3 + @win_away_matches.length*3 + @draw_home_matches.length + @draw_away_matches.length
  end

  def season_home_points(season)
    @season = Season.find(season)
    @win_home_matches = @season.matches.find :all, :conditions => ['team_id = ? AND home > away', self]
    @draw_home_matches = @season.matches.find :all, :conditions => ['team_id = ? AND home = away', self]
    @points = @win_home_matches.length*3 + @draw_home_matches.length
  end

  def season_away_points(season)
    @season = Season.find(season)
    @win_away_matches = @season.matches.find :all, :conditions => ['rival_id = ? AND home < away', self]
    @draw_away_matches = @season.matches.find :all, :conditions => ['rival_id = ? AND home = away', self]
    @points = @win_away_matches.length*3 + @draw_away_matches.length
  end

  def season_matches(season)
    @season = Season.find(season)
    @time = Time.now
    @matches = @season.matches.find :all, :conditions => ['(team_id = ? OR rival_id = ?) AND match_start <= ?', self, self, @time]
    #@matches = @season.matches.find :all, :conditions => ['home NOT ? OR away NOT ?', nil, nil]
    @matches.length
  end

  def season_home_matches(season)
    @season = Season.find(season)
    @time = Time.now
    @matches = @season.matches.find :all, :conditions => ['team_id = ? AND match_start <= ?', self, @time]
    #@matches = @season.matches.find :all, :conditions => ['home NOT ? OR away NOT ?', nil, nil]
    @matches.length
  end

  def season_away_matches(season)
    @season = Season.find(season)
    @time = Time.now
    @matches = @season.matches.find :all, :conditions => ['team_id = ? AND match_start <= ?', self, @time]
    #@matches = @season.matches.find :all, :conditions => ['home NOT ? OR away NOT ?', nil, nil]
    @matches.length
  end

  def season_home_goals(season)
    @season = Season.find(season)
    @goals = 0
    @matches = @season.matches.find :all, :conditions => ['team_id = ?', self]
    for match in @matches
      if match.home
        @goals += match.home
      end
    end
    @goals
  end

  def season_away_goals(season)
    @season = Season.find(season)
    @goals = 0
    @matches = @season.matches.find :all, :conditions => ['rival_id = ?', self]
    for match in @matches
      if match.away
        @goals += match.away
      end
    end
    @goals
  end

  def season_goals(season)
    @season = Season.find(season)
    @goals = 0
    @matches = @season.matches.find :all, :conditions => ['team_id = ? OR rival_id = ?', self, self]
    for match in @matches
      if match.team == self
        if match.home
          @goals += match.home
        end
      else
        if match.away
          @goals += match.away
        end
      end
    end
    @goals
  end

  def season_lost_goals(season)
    @season = Season.find(season)
    @goals = 0
    @matches = @season.matches.find :all, :conditions => ['team_id = ? OR rival_id = ?', self, self]
    for match in @matches
      if match.team == self
        if match.away
          @goals += match.away
        end
      else
        if match.home
          @goals += match.home
        end
      end
    end
    @goals
  end

  def season_home_goals(season)
    @season = Season.find(season)
    @goals = 0
    @matches = @season.matches.find :all, :conditions => ['team_id = ?', self]
    for match in @matches
      if match.home
        @goals +=  match.home
      end
    end
    @goals
  end

  def season_away_goals(season)
    @season = Season.find(season)
    @goals = 0
    @matches = @season.matches.find :all, :conditions => ['rival_id = ?', self]
    for match in @matches
      if match.away
        @goals +=  match.away
      end
    end
    @goals
  end

  def season_home_lost_goals(season)
    @season = Season.find(season)
    @goals = 0
    @matches = @season.matches.find :all, :conditions => ['team_id = ?', self]
    for match in @matches
      if match.away
        @goals +=  match.away
      end
    end
    @goals
  end

  def season_away_lost_goals(season)
    @season = Season.find(season)
    @goals = 0
    @matches = @season.matches.find :all, :conditions => ['rival_id = ?', self]
    for match in @matches
      if match.home
        @goals +=  match.home
      end
    end
    @goals
  end


  def season_wins(season)
    self.season_home_wins(season) + self.season_away_wins(season)
  end

  def season_losses(season)
    self.season_home_losses(season) + self.season_away_losses(season)
  end

  def season_draws(season)
    self.season_home_draws(season) + self.season_away_draws(season)
  end

  def season_home_wins(season)
    @season = Season.find(season)
    @win_home_matches = @season.matches.find :all, :conditions => ['team_id = ? AND home > away', self]
    @win_home_matches.length
  end
  
  def season_away_wins(season)
    @season = Season.find(season)
    @win_away_matches = @season.matches.find :all, :conditions => ['rival_id = ? AND home < away', self]
    @win_away_matches.length
  end

  def season_home_losses(season)
    @season = Season.find(season)
    @lose_home_matches = @season.matches.find :all, :conditions => ['team_id = ? AND home < away', self]
    @lose_home_matches.length
  end

  def season_away_losses(season)
    @season = Season.find(season)
    @lose_away_matches = @season.matches.find :all, :conditions => ['rival_id = ? AND home > away', self]
    @lose_away_matches.length
  end

  def season_home_draws(season)
    @season = Season.find(season)
    @draw_home_matches = @season.matches.find :all, :conditions => ['team_id = ? AND home = away', self]
    @draw_home_matches.length
  end

  def season_away_draws(season)
    @season = Season.find(season)
    @draw_away_matches = @season.matches.find :all, :conditions => ['rival_id = ? AND home = away', self]
    @draw_away_matches.length
  end

end
