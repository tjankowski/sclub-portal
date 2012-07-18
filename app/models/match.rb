# -*- encoding : utf-8 -*-
class Match < ActiveRecord::Base
  has_many :appearances, :order => 'position', :dependent => :destroy
  belongs_to :season
  belongs_to :team
  belongs_to :rival, :class_name => "Team", :foreign_key => "rival_id"
  has_one :live_broadcast, :dependent => :destroy

  validates_presence_of :team
  validates_presence_of :rival
  validates_presence_of :season

  #   t.integer :season_id
  #   t.integer :team_id
  #   t.integer :rival_id
  #   t.datetime :match_start
  #   t.integer :home
  #   t.integer :away

  def home_goals
    @goals = []
    self.home_appearances.each do |appearance|
      @goals = @goals + appearance.goals
    end
    @goals = @goals.sort_by { |goal| goal.minute}
    return @goals
  end

  def away_goals
    @goals = []
    self.away_appearances.each do |appearance|
      @goals = @goals + appearance.goals
    end
    @goals = @goals.sort_by { |goal| goal.minute}
    return @goals
  end

  def home_cards
    @cards = []
    self.home_appearances.each do |appearance|
      @cards = @cards + appearance.cards
    end
    @cards = @cards.sort_by { |card| card.minute}
    return @cards
  end

  def away_cards
    @cards = []
    self.away_appearances.each do |appearance|
      @cards = @cards + appearance.cards
    end
    @cards = @cards.sort_by { |card| card.minute}
    return @cards
  end
  
  def home_appearances
    @players = []
    self.appearances.each do |appearance|
      if appearance.team == self.team
        @players << appearance
      end
    end
    #@players.sort_by { |appearance| appearance.position }
    return @players
  end

  def away_appearances
    @players = []
    self.appearances.each do |appearance|
      if appearance.team == self.rival
        @players << appearance
      end
    end
    #@players.sort_by { |player| player.position }
    return @players
  end

  def rival_appearances
    self.away_appearances
  end

  def teams
    [self.team, self.rival]
  end

  def team_official_name
    self.team.official_name if self.team
  end

  def team_official_name=(name)
    self.team = Team.find_by_official_name(name) unless name.blank?
  end

  def rival_official_name
    self.rival.official_name if self.team
  end

  def rival_official_name=(name)
    self.rival = Team.find_by_official_name(name) unless name.blank?
  end

  def has_live_broadcast?
    !(self.live_broadcast.nil?)
  end
end
