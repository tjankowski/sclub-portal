# -*- encoding : utf-8 -*-
class CreateArticleGalleries < ActiveRecord::Migration
  def self.up
    create_table :article_galleries do |t|
      t.column :article_id, :integer
      t.column :gallery_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :article_galleries
  end
end
