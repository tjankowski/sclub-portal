# -*- encoding : utf-8 -*-
class Season < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  has_many :matches, :order => "match_start ASC", :dependent => :destroy
  #has_many :teams, :through => :entries
  has_many :teams, :through => :matches
  has_many :season_standings, :order => "position ASC", :dependent => :destroy

  #      t.string :name
  #      t.date :start_at
  #      t.date :end_at
  #      t.boolean :published

  def full_name
    name + ' ' + start_at.year.to_s + '-' + end_at.year.to_s
  end

  def last_match
    @time = Time.now
    @matches = self.matches.find :all,:conditions => ['match_start < ?', @time], :order => "match_start DESC"
    @matches.first
  end

  def next_match
    @time = Time.now
    @matches = self.matches.find :all,:conditions => ['match_start > ?', @time], :order => "match_start ASC"
    @matches.first
  end

  def all_teams
    @all_teams = []
    #@all_teams.concat(self.teams)
    for match in self.matches do
      @all_teams.concat(match.teams)
    end
    @all_teams.uniq!
  end

  def proccess_season_standings
    season_teams = self.teams_standings
    for team in season_teams
      
      standing = SeasonStanding.find(:first, :conditions => ["season_id = ? AND team_id = ?", self, team])
      if standing
      else
        standing = SeasonStanding.create
      end

      standing.season = self
      standing.team = team
      standing.position = season_teams.index(team)+1
      standing.matches = team.season_matches(self)
      standing.points = team.season_points(self)
      standing.wins = team.season_wins(self)
      standing.draws = team.season_draws(self)
      standing.losses = team.season_losses(self)
      standing.goals = team.season_goals(self)
      standing.lost_goals = team.season_lost_goals(self)

      standing.home_matches = team.season_home_matches(self)
      standing.home_points = team.season_home_points(self)
      standing.home_wins = team.season_home_wins(self)
      standing.home_draws = team.season_home_draws(self)
      standing.home_losses = team.season_home_losses(self)
      standing.home_goals = team.season_home_goals(self)
      standing.home_lost_goals = team.season_home_lost_goals(self)

      standing.away_matches = team.season_away_matches(self)
      standing.away_points = team.season_away_points(self)
      standing.away_wins = team.season_away_wins(self)
      standing.away_draws = team.season_away_draws(self)
      standing.away_losses = team.season_away_losses(self)
      standing.away_goals = team.season_away_goals(self)
      standing.away_lost_goals = team.season_away_lost_goals(self)

      standing.save
    end
  end

  def teams_standings
    sort_teams(all_teams)
  end

  def teams_standings_by_team(team)
    teams_list = self.teams_standings
    @first = teams_list.first(3)
    @last = teams_list.last(3)
    @teams = []
    @teams.concat(@first)
    @teams.concat(@last)
    @teams << team
    sort_teams(@teams.uniq!)
  end

  def team_position(team)
    @teams = teams_standings
    @teams.index(team)+1
  end

  private
  
  def sort_teams(arr)
    return arr if arr.size <= 1
    pivot = arr.pop
    left, right = arr.partition {|e| compare_by_points(e, pivot) }
    return sort_teams(left) + [pivot] + sort_teams(right)
  end

  def compare_by_points(team1, team2)
    points1 = team1.season_points(self)
    points2 = team2.season_points(self)
    if points1 > points2
      return true
    elsif points1 < points2
      return false
    else
      return matches_between(team1, team2)
    end
  end

  def matches_between(team1, team2)
    @home_match = self.matches.find :first, :conditions => ['team_id = ? AND rival_id = ? AND match_start < ?', team1, team2, Time.now]
    @away_match = self.matches.find :first, :conditions => ['team_id = ? AND rival_id = ? AND match_start < ?', team2, team1, Time.now]
    points1 = 0
    points2 = 0
    goals1 = 0
    goals2 = 0

    if @home_match && @home_match.home && @home_match.away
      if @home_match.home > @home_match.away
        points1 += 3
      elsif @home_match.home < @home_match.away
        points2 += 3
      else
        points1 += 1
        points2 += 1
      end
      goals1 += @home_match.home
      goals2 += @home_match.away
    end

    if @away_match && @away_match.home && @away_match.away
      if @away_match.home < @away_match.away
        points1 += 3
      elsif @away_match.home > @away_match.away
        points2 += 3
      else
        points1 += 1
        points2 += 1
      end
      goals1 += @away_match.away
      goals2 += @away_match.home
    end
    
    
    if points1 > points2
      return true
    elsif points1 < points2
      return false
    else
      if goals1 > goals2
        return true
      elsif goals1 < goals2
        return false
      else
        goals1 = team1.season_goals(self) - team1.season_lost_goals(self)
        goals2 = team2.season_goals(self) - team2.season_lost_goals(self)
        if goals1 > goals2
          return true
        elsif goals1 < goals2
          return false
        else
          return false
        end
      end
    end
  end
  
end
