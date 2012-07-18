# -*- encoding : utf-8 -*-
class CreateAvatars < ActiveRecord::Migration
  def self.up
    create_table :avatars do |t|
       t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :avatars
  end
end
