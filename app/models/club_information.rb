# -*- encoding : utf-8 -*-
class ClubInformation < ActiveRecord::Base

  FIELDS = %w(history officials contact trophies sponsors)
  
  #Prztłumaczone nazwy pól
  HUMANIZED_ATTRIBUTES = {
    :history => "Historia",
    :sponsors => "Sponsorzy",
    :contact => "Kontakt",
    :trophies => "Trofea",
    :officials => "Zarząd",
  }

  #Tłumaczy nazwy pól
  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

end
