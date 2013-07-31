class Sony < ActiveRecord::Base
  attr_accessible :amigos_share, :facebook_id, :intentos

  def has_tries_left
    (intento > 0 && intentos <= 3)!
  end
end
