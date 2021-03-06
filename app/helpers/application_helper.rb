# -*- encoding : utf-8 -*-
module ApplicationHelper
  
  #Zwraca odnośnik do wykorzystania w układzie nawigacji
  def nav_link(text, controller, action="index")
    link_to_unless_current text, :controller => controller, :action => action do
      content_tag :span, text, :id => 'current_site'
    end
  end

  #Zwraca odnośnik do wykorzystania w układzie nawigacji z id
  def nav_link_id(text, controller, action, id)
    link_to_unless_current text, :controller => controller, :action => action, :id => id do
      content_tag :span, text, :id => 'current_site'
    end
  end

  #Zwraca tablicę pomocniczą zmiennych lokalnych w partial (controller, action, id)
  def locals_for_partial_cai(controller, action, id)
    { :controller => controller, :action => action, :id => id}
  end

  #Zwraca tablicę pomocniczą zmiennych lokalnych w partial (controller, action)
  def locals_for_partial_ca(controller, action)
    { :controller => controller, :action => action}
  end

  #Zwraca link do zarządzania stroną
  def tool_link_id(picture, text, controller, action, id)
    content_tag_for :div, :null, :class => 'inline_links' do
    link_to :controller => controller, :action => action, :id => id do
        image_tag(picture, :size => "15x15", :hspace => "5")+"<small>#{text}</small>"
      end
    end
  end

  #Zwraca link do zarządzania stroną
  def tool_link(picture, text, controller, action = "index")
    content_tag_for :div, :null, :class => 'inline_links' do
    link_to :controller => controller, :action => action do
        image_tag(picture, :size => "15x15", :hspace => "5")+"<small>#{text}</small>"
      end
    end
  end

  #Zwraca minuty meczu
  def minutes
    @minutes = []
    0.upto(90) { |i| [@minutes << i]  }
    @minutes
  end

  #Zwraca informacje do relacji live
  def broadcast_messages
    @info = ['Gol', 'Zmiana','Żółta Kartka','Druga Żółta Kartka','Czerwona Kartka',]
  end
  
end
