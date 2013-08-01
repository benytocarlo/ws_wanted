#coding: utf-8
class SoniesController < ApplicationController
  respond_to :json
  def create_participation
  	if Sony.create :facebook_id => params[:facebook_id], :intentos => 3
      respond_with ({:respuesta => "create_participation", :codigo => 3}).to_json
    end
  end

  def intentos
    @intentos = Sony.find_by_facebook_id(params[:facebook_id])
    @numero_de_intentos = @intentos.intentos
    respond_with ({ :numero_de_intentos => @numero_de_intentos })
  end

  def create_winner
    @sony_participant = Sony.find_by_facebook_id(params[:facebook_id])
    @code = Code.find_by_description(params[:code])

    if @code.nil?
      @code = Code.new :description => params[:code]
    end

    if @sony_participant.nil?
      respond_with ({:respuesta => "Participant error"})
    else  
      if @code.is_valid && @sony_participant.has_tries_left then
        add_winner_to_code @code, @sony_participant
        @sony_participant.add_try
        respond_with ({:respuesta => "Winner", :intentos => @sony_participant.intentos}).to_json
      else
        @sony_participant.add_try
        respond_with ({:respuesta => "Loser", :intentos => @sony_participant.intentos}).to_json
      end
    end
  end

  def add_winner_to_code code, sony_participant
    code.update_attributes :facebook_uid => sony_participant.facebook_id
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
