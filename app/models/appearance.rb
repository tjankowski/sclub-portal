# -*- encoding : utf-8 -*-
class Appearance < ActiveRecord::Base
  ajaxful_rateable :stars => 5, :cache_column => :rating_average
  has_many :goals, :order => 'minute', :dependent => :destroy
  has_many :cards, :order => 'minute', :dependent => :destroy
  belongs_to :player
  belongs_to :match
  belongs_to :team
  
  #      t.integer :player_id
  #      t.integer :match_id
  #      t.integer :team_id
  #      t.float   :rating
  #      t.integer :start
  #      t.integer :end
  #      t.integer :number
  #      t.decimal :rating_average, :default => 3, :precision => 6, :scale => 2

  #validates_presence_of :player, :match, :team
  #validates_presence_of :start, :end
  #validates_presence_of :number

  def rated_by_current_user?(user)
    self.appearance_ratings.exists?(:user_id => user)
  end

  def player_name
    self.player.full_name if self.player
  end

  def player_name=(name)
    self.player = Player.find_by_full_name(name)
  end

  def minutes
    self.end - self.start
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
