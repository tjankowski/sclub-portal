# -*- encoding : utf-8 -*-
class ArticleGallery < ActiveRecord::Base
  belongs_to :article
  belongs_to :gallery
end
