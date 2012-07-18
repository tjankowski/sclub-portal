# -*- encoding : utf-8 -*-
class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.integer :player_id
      t.integer :appearance_id
      t.integer :team_id
      t.integer :minute
      t.text :info
      t.boolean :own

      t.timestamps
    end
  end

  def self.down
    drop_table :goals
  end
end
