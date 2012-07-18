# -*- encoding : utf-8 -*-
module LiveBroadcastsHelper

  def status_pl(live_broadcast)
    case live_broadcast.status
    when "begin"
      "Przed meczem"
    when "first"
      "Pierwsza połowa"
    when "half"
      "Przerwa"
    when "second"
      "Druga połowa"
    when "end"
      "Koniec"
    else
      ""
    end
  end

  def start_next_status_button(live_broadcast)
    case live_broadcast.status
    when "begin"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Pierwsza połowa", :image => "Button Play.png"}.merge(locals_for_partial_cai("live_broadcasts", "start_next_status", live_broadcast))
    when "first"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Przerwa", :image => "Button Pause.png"}.merge(locals_for_partial_cai("live_broadcasts", "start_next_status", live_broadcast))
    when "half"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Druga połowa", :image => "Button Play.png"}.merge(locals_for_partial_cai("live_broadcasts", "start_next_status", live_broadcast))
    when "second"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Koniec", :image => "Button Stop.png"}.merge(locals_for_partial_cai("live_broadcasts", "next_status", live_broadcast))
    when "end"
      "<b>Mecz zakończony</b>"
    else
      ""
    end
  end

  def next_status_button(live_broadcast)
    case live_broadcast.status
    when "begin"
      if live_broadcast.first_half_start.nil?
        "Najpierw rozpocznij pierwszą połowę."
      else
        render :partial => "partials/tool_inline_link", :locals => {:text => "Przejdź do pierwszej połowy", :image => "Button Forward.png"}.merge(locals_for_partial_cai("live_broadcasts", "next_status", live_broadcast))
      end
    when "first"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Przejdź do przerwy", :image => "Button Forward.png"}.merge(locals_for_partial_cai("live_broadcasts", "next_status", live_broadcast))
    when "half"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Przejdź do drugiej połowy", :image => "Button Forward.png"}.merge(locals_for_partial_cai("live_broadcasts", "next_status", live_broadcast))
    when "second"
      if live_broadcast.second_half_start.nil?
        "Najpierw rozpocznij drugą połowę."
      else
        render :partial => "partials/tool_inline_link", :locals => {:text => "Przejdź do końca", :image => "Button Forward.png"}.merge(locals_for_partial_cai("live_broadcasts", "next_status", live_broadcast))
      end
    when "end"
      "<b>Mecz zakończony</b>"
    else
      ""
    end
  end

  def last_status_button(live_broadcast)
    case live_broadcast.status
    when "begin"
      ""
    when "first"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Confnij do początku", :image => "Button Rewind.png"}.merge(locals_for_partial_cai("live_broadcasts", "last_status", live_broadcast))
    when "half"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Confnij do pierwszej połowy", :image => "Button Rewind.png"}.merge(locals_for_partial_cai("live_broadcasts", "last_status", live_broadcast))
    when "second"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Confnij do przerwy", :image => "Button Rewind.png"}.merge(locals_for_partial_cai("live_broadcasts", "last_status", live_broadcast))
    when "end"
      render :partial => "partials/tool_inline_link", :locals => {:text => "Confnij do drugej połowy", :image => "Button Rewind.png"}.merge(locals_for_partial_cai("live_broadcasts", "last_status", live_broadcast))
    else
      ""
    end
  end

end
