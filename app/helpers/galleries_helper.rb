# -*- encoding : utf-8 -*-
module GalleriesHelper

  def new_gallery_tool_link
    tool_link 'images.png', 'Nowa', 'galleries', 'new'
  end

  def edit_gallery_tool_link(gallery)
    tool_link_id 'images.png', 'Edytuj', 'galleries', 'edit', gallery
  end
end
