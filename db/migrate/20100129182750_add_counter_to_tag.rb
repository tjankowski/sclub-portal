# -*- encoding : utf-8 -*-
class AddCounterToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :counter, :int
  end

  def self.down
    remove_column :tags, :counter
  end
end
