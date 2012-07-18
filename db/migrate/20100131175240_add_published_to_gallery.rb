# -*- encoding : utf-8 -*-
class AddPublishedToGallery < ActiveRecord::Migration
  def self.up
    add_column :galleries, :published, :boolean
  end

  def self.down
    remove_column :galleries, :published
  end
end
