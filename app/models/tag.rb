# -*- encoding : utf-8 -*-
class Tag < ActiveRecord::Base
  has_many :article_tags, :dependent => :destroy
  has_many :articles, :through => :article_tags

  validates_uniqueness_of :name, :message => "już istnieje."

  #Prztłumaczone nazwy pól
  HUMANIZED_ATTRIBUTES = {
    :name => "Nazwa",
  }

  #Tłumaczy nazwy pól
  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def self.search(search)
    if(search)
      find(:all, :conditions => ['lower(name) LIKE ?', "%#{search.downcase}%"], :order => 'counter DESC')
    else
      find :all, :order => 'counter DESC'
    end
  end
  
  def visit
    self.counter ||= 0
    self.counter += 1
    self.save
  end

end
