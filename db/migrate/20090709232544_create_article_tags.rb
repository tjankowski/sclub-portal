# -*- encoding : utf-8 -*-
class CreateArticleTags < ActiveRecord::Migration
  def self.up
    create_table :article_tags do |t|
      t.column :article_id, :integer, :null => "false"
      t.column :tag_id, :integer, :null => "false"
      t.timestamps
    end
  end

  def self.down
    drop_table :article_tags
  end
end
