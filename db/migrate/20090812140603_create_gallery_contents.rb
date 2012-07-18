# -*- encoding : utf-8 -*-
class CreateGalleryContents < ActiveRecord::Migration
  def self.up
    create_table :gallery_contents do |t|
      t.column :gallery_id, :integer, :null => "false"
      t.column :photo_id, :integer, :null => "false"
      t.timestamps
    end
  end

  def self.down
    drop_table :gallery_contents
  end
end
