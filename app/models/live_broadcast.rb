# -*- encoding : utf-8 -*-
class LiveBroadcast < ActiveRecord::Base
  belongs_to :match
  has_many :broadcast_messages, :order => "created_at", :dependent => :destroy

  def start_first_half
    self.first_half_start = Time.now
    if !self.is_status_first?
      self.status = 'first'
    end
    self.first_half_start
  end

  def start_second_half
    self.second_half_start = Time.now
    if !self.is_status_second?
      self.status = 'second'
    end
  end

  def start_next_status
    self.status = case self.status
    when "begin"
      self.start_first_half
      "first"
    when "first"
      "half"
    when "half"
       self.start_second_half
      "second"
    when "second"
      "end"
    when "end"
      "end"
    else
      "end"
    end
  end

  def next_status
    self.status = case self.status
    when "begin"
      "first"
    when "first"
      "half"
    when "half"
      "second"
    when "second"
      "end"
    when "end"
      "end"
    else
      "end"
    end
  end

  def last_status
    self.status = case self.status
    when "begin"
      "begin"
    when "first"
      "begin"
    when "half"
      "first"
    when "second"
      "half"
    when "end"
      "second"
    else
      "end"
    end
  end

  def reset_status
    self.first_half_start = ""
    self.second_half_start = ""
    self.status = 'begin'
  end

  def is_status_begin?
    if self.status == 'begin'
      true
    else
      false
    end
  end

  def is_status_first?
    if self.status == 'first'
      true
    else
      false
    end
  end

  def is_status_half?
    if self.status == 'half'
      true
    else
      false
    end
  end

  def is_status_second?
    if self.status == 'second'
      true
    else
      false
    end
  end

  def is_status_end?
    if self.status == 'end'
      true
    else
      false
    end
  end

end
