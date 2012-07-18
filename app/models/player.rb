# -*- encoding : utf-8 -*-
class Player < ActiveRecord::Base
  has_many :appearances, :dependent => :destroy
  has_many :goals, :dependent => :destroy
  has_many :cards, :dependent => :destroy
  has_many :entries, :dependent => :destroy
  has_many :player_gallery, :dependent => :destroy
  has_many :seasons, :through => :entries, :order => "end_at DESC"
  has_many :galleries, :through => :player_gallery

  validates_presence_of :first_name, :message => 'musi być podane.'
  validates_presence_of :last_name, :message => 'musi być podane.'
  validates_presence_of :position, :message => 'musi być podane.'

  #Prztłumaczone nazwy pól
  HUMANIZED_ATTRIBUTES = {
    :first_name => "Imię",
    :last_name => "Nazwisko",
    :weight => "Waga",
    :height => "Wzrost",
    :birthdate => "Data ur.",
    :information => "Informacje",
    :position => "Pozycja",
    :side => "Strona",
  }

  #Tłumaczy nazwy pól
  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def full_name
    [first_name, last_name].join(' ') 
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last  
  end

  def self.find_by_full_name(name)
    if !name.blank?
      if name.include?(".")
        split = name.split('.', 2)
        return @player = Player.find(split.first)
      else
        split = name.split(' ', 2)
        first_name = split.first
        last_name = split.last
        return @player = Player.find(:first, :conditions => ['first_name LIKE ? AND last_name LIKE ?', first_name, last_name] )
      end
    end
  end

  def full_position
    "#{position} #{side}"
  end

  def has_galllery?
    !(self.galleries.empty?)
  end

  def has_gallery?(gallery)
    self.galleries.find_by_id(gallery) ? true : false
  end

  def last_appearances(number)
    if self.appearances && number > 0
      last_appearances = self.appearances.sort_by {|appearance| Match.find(appearance.match_id).match_start}
      if last_appearances.size > 0
        last_appearances.last(number)
      else
        nil
      end
    else
      nil
    end
  end

  def last_appearances_rating_average(number)
    if self.appearances && number > 0
      last_appearances = self.appearances.sort_by {|appearance| Match.find(appearance.match_id).match_start}
      if last_appearances.size > 0
        average = 0
        last_appearances = last_appearances.last(number)
        for appearance in last_appearances
          average += appearance.rating_average
        end
        (average/last_appearances.size).round(2)
      else
        0
      end
    else
      0
    end
  end

  def last_season
    self.seasons.first
  end

  def matches_played
    if self.appearances
      self.appearances.size
    else
      0
    end
  end

  def matches_played_in_season(season)
    season_appearances = []
    @season = Season.find(season)
    for match in @season.matches
      season_appearances.concat self.appearances.find :all,:conditions => ['match_id = ?', match]
    end
    season_appearances.uniq!
    season_appearances.size
  end

  def minutes_in_season(season)
    counter = 0
    season_appearances = []
    @season = Season.find(season)
    for match in @season.matches
      season_appearances.concat self.appearances.find :all,:conditions => ['match_id = ?', match]
    end
    season_appearances.uniq!
    for appearance in season_appearances
      counter += appearance.minutes
    end
    return counter
  end

  def goals_scored_in_season(season)
    counter = 0
    season_appearances = []
    @season = Season.find(season)
    for match in @season.matches
      season_appearances.concat self.appearances.find :all,:conditions => ['match_id = ?', match]
    end
    season_appearances.uniq!
    for appearance in season_appearances
      counter += appearance.goals_scored
    end
    return counter
  end

  def yellow_cards_in_season(season)
    counter = 0
    season_appearances = []
    @season = Season.find(season)
    for match in @season.matches
      season_appearances.concat self.appearances.find :all,:conditions => ['match_id = ?', match]
    end
    season_appearances.uniq!
    for appearance in season_appearances
      counter += appearance.yellow_cards
    end
    return counter
  end

  def red_cards_in_season(season)
    counter = 0
    season_appearances = []
    @season = Season.find(season)
    for match in @season.matches
      season_appearances.concat self.appearances.find :all,:conditions => ['match_id = ?', match]
    end
    season_appearances.uniq!
    for appearance in season_appearances
      counter += appearance.red_cards
    end
    return counter
  end

  def minutes
    counter = 0   
    if self.appearances
      for appearance in self.appearances
        counter += appearance.minutes
      end
      return counter
    else
      0
    end
  end

  def goals_scored
    if self.goals
      counter = self.goals.find_all_by_own false
      if counter
        counter.size
      else
        0
      end
    else
      0
    end
  end

  def own_goals_scored
    if self.goals
      counter = self.goals.find_all_by_own true
      if counter
        counter.size
      else
        0
      end
    else
      0
    end
  end

  def yellow_cards
    if self.cards
      counter = self.cards.find_all_by_color 'Żółta Kartka'
      counter.concat(self.cards.find_all_by_color 'Druga Żółta Kartka')
      if counter
        counter.size
      else
        0
      end
    else
      0
    end
  end

  def red_cards
    if self.cards
      counter = self.cards.find_all_by_color 'Czerwona Kartka'
      if counter
        counter.size
      else
        0
      end
    else
      0
    end
  end

end
