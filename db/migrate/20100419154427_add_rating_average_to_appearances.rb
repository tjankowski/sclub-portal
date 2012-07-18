# -*- encoding : utf-8 -*-
class AddRatingAverageToAppearances < ActiveRecord::Migration
  def self.up
    add_column :appearances, :rating_average, :decimal, :default => 3, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :appearances, :rating_average
  end
end
