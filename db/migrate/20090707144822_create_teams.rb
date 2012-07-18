# -*- encoding : utf-8 -*-
class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.column :club_id, :integer, :uniques => false
      t.column :name, :string, :uniques => false
      t.column :official_name, :string, :uniques => true

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
