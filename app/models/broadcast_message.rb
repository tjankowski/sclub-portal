# -*- encoding : utf-8 -*-
class BroadcastMessage < ActiveRecord::Base
  belongs_to :live_broadcast

  def initialize_minute
    self.minute = case self.live_broadcast.status
    when "begin"
      ''
    when "first"
      @minute = to_minutes(self.created_at-self.live_broadcast.first_half_start)
      first_half_time(@minute)
    when "half"
      ''
    when "second"
      @minute = to_minutes(self.created_at-self.live_broadcast.second_half_start)
      second_half_time(@minute)
    when "end"
      ''
    else
      ''
    end
  end

  private
  def to_minutes(sec)
    @minute = (sec/60).to_i
  end

  private
  def first_half_time(minutes)
    if minutes > 45
      @rest = minutes - 45
      @time = '45+' + @rest.to_s
      return @time
    else
      minutes
    end
  end

  private
  def second_half_time(minutes)
    if minutes > 45
      @rest = minutes - 45
      @time = '90+' + @rest.to_s
      return @time
    else
      minutes+45
    end
  end

end
