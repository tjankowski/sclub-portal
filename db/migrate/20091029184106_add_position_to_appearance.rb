# -*- encoding : utf-8 -*-
class AddPositionToAppearance < ActiveRecord::Migration
  def self.up
    add_column :appearances, :position, :integer
  end

  def self.down
    remove_column :appearances, :position
  end
end
