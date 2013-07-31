class Code < ActiveRecord::Base
  attr_accessible :description, :activo, :facebook_id
  
  def self.count_inactives
    Code.find(:all, :conditions => ["activo = ?", false]).count
  end
end
