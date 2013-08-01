class Sony < ActiveRecord::Base
  attr_accessible :amigos_share, :facebook_id, :intentos
  validates_uniqueness_of :facebook_id

  def has_tries_left
    if intentos > 0 && intentos <= 3 then
      return true
    else
      return false
    end
  end

  def add_try
    @nuevo = self.intentos - 1
    update_attributes(:intentos => @nuevo )
  end
end
