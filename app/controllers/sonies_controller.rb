#coding: utf-8
class SoniesController < InheritedResources::Base
  respond_to :json
  def create_participation
  	if Sony.create :facebook_id => params[:facebook_id], :intentos => 3
      respond_with ({:respuesta => "create_participation", :codigo => 3}).to_json
    end
  end

  def update_participation
    @update_friends = Sony.find_by_facebook_id(params[:facebook_id])
    if !@update_friends.nil?
      if @update_friends.update_attributes(:amigos_share => params[:amigos_share])
        respond_with ({:respuesta => "update_participation"}).to_json
      else
        respond_with ({:respuesta => "no update_participation"}).to_json
      end
    else
      respond_with ({:respuesta => "no update_participation"}).to_json
    end
  end

  def user_tries?
	if get_tries(params[:facebook_id])
	else
	  respond_with ({:respuesta => "no encontrado", :codigo => 0}).to_json
	end
  end

  def get_tries facebook_id
	@intentos = Sony.find_by_facebook_id(facebook_id)
    if !@intentos.nil?
	  respond_with ({:respuesta => "encontrado", :intentos => @intentos.intentos}).to_json
    end
  end
end