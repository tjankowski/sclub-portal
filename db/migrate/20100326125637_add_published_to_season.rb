# -*- encoding : utf-8 -*-
class AddPublishedToSeason < ActiveRecord::Migration
  def self.up
    add_column :seasons, :published, :boolean
  end

  def self.down
    remove_column :seasons, :published
  end
end
