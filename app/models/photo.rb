# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :gallery_content
  has_many :main_photo
  has_many :main_galleries, :through => :main_photo
  has_many :galleries, :through => :gallery_content
  has_attached_file :view, :styles => { :small => "150x150>", :medium => "300x300>", :big => "600x600>"},
    :url => "/photos/:id/:style/:basename.:extension",
    :path => ":rails_root/public/photos/:id/:style/:basename.:extension"

  validates_attachment_presence :view
  validates_attachment_size :view, :less_than => 1.megabytes
  validates_attachment_content_type :view, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']
end
