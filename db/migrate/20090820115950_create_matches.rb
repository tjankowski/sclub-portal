# -*- encoding : utf-8 -*-
class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.column :season_id, :integer
      t.column :team_id, :integer
      t.column :rival_id, :integer
      t.datetime :match_start
      t.integer :home
      t.integer :away
      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
