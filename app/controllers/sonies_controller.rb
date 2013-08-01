#coding: utf-8
class SoniesController < ApplicationController
  respond_to :json
  def create_participation
  	if Sony.create :facebook_id => params[:facebook_id], :intentos => 3
      respond_with ({:respuesta => "create_participation", :codigo => 3}).to_json
    end
  end

  # Devuelve los premios que no están tomados, activos o inactivos.
  #
  def devuelve_premios
    @premios = Code.all(:conditions => {:facebook_uid => ""}).count
    respond_with ({ :premios => @premios })
  end
  
  def devuelve_participacion
    @premios = Code.all(:conditions => {:facebook_uid => "", :activo => true}).count
    if @premios == 0
      respond_with ({ :respuesta => "nojugar" })
    elsif @premios > 0
      respond_with ({ :respuesta => "jugar" })
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

    if we_have_no_prizes_left then
      respond_with ({:respuesta => "No_Prizes_Left", :intentos => @sony_participant.intentos}).to_json
    else#if we do have prizes left...
      if @code.nil?
        @code = Code.new :description => params[:code]
      end
      
      if @sony_participant.nil?
        respond_with ({:respuesta => "Participant error"})
      else  
        @valido = Code.find(:all, :conditions => ["description = ? and activo = 't'", params[:code]]).count
        if @valido == 1 then
          add_winner_to_code @code, @sony_participant
          @sony_participant.add_try
          respond_with ({:respuesta => "Winner", :intentos => @sony_participant.intentos}).to_json
        else
          @sony_participant.add_try
          respond_with ({:respuesta => "Loser", :intentos => @sony_participant.intentos}).to_json
        end
      end
    end
  end

  def add_winner_to_code code, sony_participant
    code.update_attributes :facebook_uid => sony_participant.facebook_id
  end

  def update_participation
    @update_friends = Sony.find_by_facebook_id(params[:facebook_id])
    if !@update_friends.nil?
      if @update_friends.update_attributes(:intentos => 3 , :amigos_share => @update_friends.amigos_share+"/"+params[:amigos_share])
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

private

  def we_have_no_prizes_left
    @number_of_prizes_left = Code.find(:all, :conditions => ["activo = 't' AND facebook_uid = ''"])
    if !@number_of_prizes_left.nil?
      @number_of_prizes_left = @number_of_prizes_left.count
    else
      @number_of_prizes_left = 0
    end
    if @number_of_prizes_left > 0 then
      return false
    else
      return true
    end
  end

end
