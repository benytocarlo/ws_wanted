#coding: utf-8
class SoniesController < ApplicationController
  respond_to :json

  def update_participation
    create_participation params[:facebook_id], params[:friends]
  end

  def create_participation facebook_id,friends
  	#@participant = Sonies.find_by_id_facebook facebook_id
	respond_with facebook_id
  end
end