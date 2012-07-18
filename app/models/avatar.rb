# -*- encoding : utf-8 -*-
class Avatar < ActiveRecord::Base
  belongs_to :user
  has_attached_file :view, :styles => { :small => "150x150>", :medium => "300x300>"},
    :url => "/users/avatars/:id/:style/:basename.:extension",
  :path => ":rails_root/public/users/avatars/:id/:style/:basename.:extension"

  validates_attachment_presence :view
  validates_attachment_size :view, :less_than => 500.kilobytes
  validates_attachment_content_type :view, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
end
