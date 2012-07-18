# -*- encoding : utf-8 -*-
class CreatePlayerGalleries < ActiveRecord::Migration
  def self.up
    create_table :player_galleries do |t|
      t.column :player_id, :integer
      t.column :gallery_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :player_galleries
  end
end
