# -*- encoding : utf-8 -*-
class CreateStaffs < ActiveRecord::Migration
  def self.up
    create_table :staffs do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.text :information
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :staffs
  end
end
