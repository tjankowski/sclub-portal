# -*- encoding : utf-8 -*-
class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.column :player_id, :integer
      t.column :season_id, :integer
      t.column :team_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
