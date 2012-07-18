# -*- encoding : utf-8 -*-
class CreateAppearances < ActiveRecord::Migration
  def self.up
    create_table :appearances do |t|
      t.integer :match_id
      t.integer :player_id
      t.integer :team_id
      t.float   :rating
      t.integer :start
      t.integer :end
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :appearances
  end
end
