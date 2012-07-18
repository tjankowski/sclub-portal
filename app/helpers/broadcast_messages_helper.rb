# -*- encoding : utf-8 -*-
module BroadcastMessagesHelper
  
  def status_image(message)
    case message.status
    when "Gol"
      image_tag "gol.png", :size => "15x15", :hspace => "5"
    when "Zmiana"
      image_tag "zmiana.png", :size => "15x15", :hspace => "5"
    when "Żółta Kartka"
      image_tag "zk.png", :size => "15x15", :hspace => "5"
    when "Druga Żółta Kartka"
      image_tag "2zk.png", :size => "15x15", :hspace => "5"
    when "Czerwona Kartka"
      image_tag "ck.png", :size => "15x15", :hspace => "5"
    else
      ""
    end
  end

end
