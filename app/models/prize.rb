class Prize < ActiveRecord::Base
  belongs_to :code
  attr_accessible :description, :facebook_id, :code

  def self.add_new_prize_entradas
  	if we_have_prize_to_add && right_time_of_day
  	  Prize.create :description => "4 entradas", :facebook_id => '0'
    end
  end

  def we_have_prize_to_add
  	Prize.find(:all, :conditions =>["description = '4 entradas'"] ).count < 300
  end

  def right_time_of_day
    Time.now.in_time_zone("Santiago").hour >= 9 && Time.now.in_time_zone("Santiago").hour <= 18
  end
end