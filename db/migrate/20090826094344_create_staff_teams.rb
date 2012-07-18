# -*- encoding : utf-8 -*-
class CreateStaffTeams < ActiveRecord::Migration
  def self.up
    create_table :staff_teams do |t|
      t.integer :staff_id
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :staff_teams
  end
end
