# -*- encoding : utf-8 -*-
module AppearancesHelper

  def edit_appearance_tool_link(appearance)
    tool_link_id 'document_edit.png', 'Edytuj', 'appearances', 'edit', appearance
  end
end
