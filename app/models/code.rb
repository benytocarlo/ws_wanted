class Code < ActiveRecord::Base
  attr_accessible :description, :activo, :facebook_uid
  
  def self.count_inactives
    Code.find(:all, :conditions => ["activo = ?", false]).count
  end

  def is_valid
    self.activo
  end
end
