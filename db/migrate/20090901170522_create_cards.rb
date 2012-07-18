# -*- encoding : utf-8 -*-
class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.integer :player_id
      t.integer :appearance_id
      t.integer :team_id
      t.integer :minute
      t.text :info
      t.string :color

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
