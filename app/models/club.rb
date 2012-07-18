# -*- encoding : utf-8 -*-
class Club < ActiveRecord::Base
  has_many :teams

  has_attached_file :logo, :styles => { :small => "150x150>", :medium => "300x300>"},
    :url => "/clubs/logo/:id/:style/:basename.:extension",
    :path => ":rails_root/public/clubs/logo/:id/:style/:basename.:extension"

  validates_attachment_presence :logo
  validates_attachment_size :logo, :less_than => 500.kilobytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  
  #Prztłumaczone nazwy pól
  HUMANIZED_ATTRIBUTES = {
    :name => "Nazwa",
    :city => "Miasto",
  }

  #Tłumaczy nazwy pól
  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  validates_uniqueness_of :name, :message => "już istnieje."
  validates_presence_of :name, :message => "nie może być pusty."
end
