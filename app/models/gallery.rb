# -*- encoding : utf-8 -*-
class Gallery < ActiveRecord::Base
  has_many :gallery_content, :dependent => :destroy
  has_many :article_gallery, :dependent => :destroy
  has_many :player_gallery, :dependent => :destroy
  belongs_to :user
  has_many :players, :through => :player_gallery
  has_many :articles, :through => :article_gallery
  has_many :photos, :through => :gallery_content
  has_one :main, :class_name => 'MainPhoto'

  # Getter
  def main_photo
    self.main.photo
  end

  def has_main_photo?
    not(main.nil?)
  end

  def empty?
    photos.empty?
  end

  def has_photo?(photo)
    self.photos.find_by_id(photo) ? true : false
  end
end
