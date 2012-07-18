# -*- encoding : utf-8 -*-
class Article < ActiveRecord::Base
  has_many :article_tags, :dependent => :destroy
  has_many :article_gallery, :dependent => :destroy
  belongs_to :user
  has_many :galleries, :through => :article_gallery
  has_many :tags, :through => :article_tags
  has_many :comments, :dependent => :destroy

  #Prztłumaczone nazwy pól
  HUMANIZED_ATTRIBUTES = {
    :title => "Tytuł",
    :body => "Treść",
    :published => "Opublikowany",
  }

  #Tłumaczy nazwy pól
  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  validates_presence_of :title, :body, :message => "nie może być pusty."

  def has_galllery?
    !(self.galleries.empty?)
  end

  def has_gallery?(gallery)
    self.galleries.find_by_id(gallery) ? true : false
  end

  def has_tag?(tag)
    self.tags.find_by_name(tag) ? true : false
  end

  def visit
    self.view_counter ||= 0
    self.view_counter += 1
    self.save
  end

  def self.tagged(tag)
    all = Article.find :all
    result = []
    for article in all
       if article.has_tag?(tag)
         result << article
       end
    end
    return result
  end

  def self.select_from_collection_by_tag(collection, tag)
    result = []
    for article in collection
       if article.has_tag?(tag)
         result << article
       end
    end
    return result
  end

  private
  def visit_tags
    for tag in self.tags
      tag.visit
    end
  end

end
