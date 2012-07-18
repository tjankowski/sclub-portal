# -*- encoding : utf-8 -*-
class Card < ActiveRecord::Base
  belongs_to :appearance
  belongs_to :player
  belongs_to :team

#      t.integer :player_id
#      t.integer :appearance_id
#      t.integer :team_id
#      t.integer :minute
#      t.text :info
#      t.string :color
end
