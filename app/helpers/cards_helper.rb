# -*- encoding : utf-8 -*-
module CardsHelper

  def card_image(card)
    case card.color
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

  def card_image_mini(card)
    case card.color
    when "Żółta Kartka"
      image_tag "zk.png", :size => "10x10"
    when "Druga Żółta Kartka"
      image_tag "2zk.png", :size => "10x10"
    when "Czerwona Kartka"
      image_tag "ck.png", :size => "10x10"
    else
      ""
    end
  end

  #Zwraca kolory kartek
  def card_colors
    @info = ['Żółta Kartka','Druga Żółta Kartka','Czerwona Kartka',]
  end
  
end
