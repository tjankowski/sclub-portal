# -*- encoding : utf-8 -*-
class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :name
      t.datetime :added
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
