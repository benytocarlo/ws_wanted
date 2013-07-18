class Code < ActiveRecord::Base
  validates_uniqueness_of :number
  attr_accessible :number, :status

  def mark_off
  	if self.status == true then
      return false
  	else
      self.update_attributes(:status => true)
      return true
  	end
  end
end
