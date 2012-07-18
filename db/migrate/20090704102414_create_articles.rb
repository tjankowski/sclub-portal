# -*- encoding : utf-8 -*-
class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.column :user_id, :integer
      t.column :published, :boolean, :default => "false"
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
