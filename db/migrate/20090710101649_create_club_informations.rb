# -*- encoding : utf-8 -*-
class CreateClubInformations < ActiveRecord::Migration
  def self.up
    create_table :club_informations do |t|
      t.column :history, :text, :default => " "
      t.column :officials, :text, :default => " "
      t.column :trophies, :text, :default => " "
      t.column :contact, :text, :default => " "
      t.column :sponsors, :text, :default => " "

      t.timestamps
    end
  end

  def self.down
    drop_table :club_informations
  end
end
