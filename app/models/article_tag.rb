# -*- encoding : utf-8 -*-
class ArticleTag < ActiveRecord::Base
  belongs_to :aritlce
  belongs_to :tag
end
