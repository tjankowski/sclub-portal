# -*- encoding : utf-8 -*-
module ArticlesHelper

  def new_article_tool_link
    tool_link 'document_add.png', 'Nowy', 'articles', 'new'
  end

  def edit_article_tool_link(article)
    tool_link_id 'document_edit.png', 'Edytuj', 'articles', 'edit', article
  end

end
