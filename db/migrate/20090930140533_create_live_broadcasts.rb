# -*- encoding : utf-8 -*-
class CreateLiveBroadcasts < ActiveRecord::Migration
  def self.up
    create_table :live_broadcasts do |t|
      t.integer  :match_id
      t.datetime :first_half_start
      t.datetime :second_half_start
      t.string   :status

      t.timestamps
    end
  end

  def self.down
    drop_table :live_broadcasts
  end
end
