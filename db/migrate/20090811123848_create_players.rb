# -*- encoding : utf-8 -*-
class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :weight
      t.integer :height
      t.date :birthdate
      t.text :information
      t.string :position
      t.string :side

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
