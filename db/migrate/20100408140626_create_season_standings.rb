# -*- encoding : utf-8 -*-
class CreateSeasonStandings < ActiveRecord::Migration
  def self.up
    create_table :season_standings do |t|
      t.integer :season_id
      t.integer :team_id
      t.integer :position
      t.integer :matches
      t.integer :points
      t.integer :wins
      t.integer :draws
      t.integer :losses
      t.integer :goals
      t.integer :lost_goals
      t.integer :away_matches
      t.integer :away_points
      t.integer :away_wins
      t.integer :away_draws
      t.integer :away_losses
      t.integer :away_goals
      t.integer :away_lost_goals
      t.integer :home_matches
      t.integer :home_points
      t.integer :home_wins
      t.integer :home_draws
      t.integer :home_losses
      t.integer :home_goals
      t.integer :home_lost_goals

      t.timestamps
    end
  end

  def self.down
    drop_table :season_standings
  end
end
