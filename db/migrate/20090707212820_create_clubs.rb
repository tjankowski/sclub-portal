# -*- encoding : utf-8 -*-
class CreateClubs < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.string :name
      t.string :city
      t.timestamps
    end
    # Dodaj domyślnie Motobi
    #club = Club.new
    #club.name = "Motobi Bystrzyca Kąty Wrocławskie"
    #club.city = "Kąty Wrocławskie"
    #club.home_page = true
    #club.save
  end

  def self.down
    drop_table :clubs
  end
end
