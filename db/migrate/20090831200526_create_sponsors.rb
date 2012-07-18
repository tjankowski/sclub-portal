# -*- encoding : utf-8 -*-
class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.string :website
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
