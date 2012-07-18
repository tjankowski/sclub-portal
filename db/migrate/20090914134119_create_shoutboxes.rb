# -*- encoding : utf-8 -*-
class CreateShoutboxes < ActiveRecord::Migration
  def self.up
    create_table :shoutboxes do |t|
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shoutboxes
  end
end
