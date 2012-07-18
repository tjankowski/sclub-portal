# -*- encoding : utf-8 -*-
class AddSummarySentenceToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :summary_sentence, :string
  end

  def self.down
    remove_column :articles, :summary_sentence
  end
end
