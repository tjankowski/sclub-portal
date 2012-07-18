# -*- encoding : utf-8 -*-
class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :name
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
