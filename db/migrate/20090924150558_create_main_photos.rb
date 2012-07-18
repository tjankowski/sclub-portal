# -*- encoding : utf-8 -*-
class CreateMainPhotos < ActiveRecord::Migration
  def self.up
    create_table :main_photos do |t|
      t.integer :gallery_id
      t.integer :photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :main_photos
  end
end
