class Prize < ActiveRecord::Base
  belongs_to :code
  attr_accessible :description, :facebook_id
end
