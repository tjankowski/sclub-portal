# -*- encoding : utf-8 -*-
class CreateBroadcastMessages < ActiveRecord::Migration
  def self.up
    create_table :broadcast_messages do |t|
      t.integer :live_broadcast_id
      t.text :body
      t.string :minute
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :broadcast_messages
  end
end
