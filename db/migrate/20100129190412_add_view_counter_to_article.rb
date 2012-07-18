# -*- encoding : utf-8 -*-
class AddViewCounterToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :view_counter, :int
  end

  def self.down
    remove_column :articles, :view_counter
  end
end
