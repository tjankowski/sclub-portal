# -*- encoding : utf-8 -*-
class CreateViewModules < ActiveRecord::Migration
  def self.up
    create_table :view_modules do |t|
      t.string :name
      t.string :partial
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :view_modules
  end
end
