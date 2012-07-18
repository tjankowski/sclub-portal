# -*- encoding : utf-8 -*-
class Sponsor < ActiveRecord::Base
  belongs_to :club
   has_attached_file :logo, :styles => { :small => "50x50>", :medium => "100x100>" },
    :url => "/sponsors/logo/:id/:style/:basename.:extension",
    :path => ":rails_root/public/sponsors/logo/:id/:style/:basename.:extension"
  
  validates_attachment_size :logo, :less_than => 1.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
