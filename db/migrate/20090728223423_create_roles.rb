# -*- encoding : utf-8 -*-
class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :rolename

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
