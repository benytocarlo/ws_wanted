#coding: utf-8
class CodesController < ApplicationController
  respond_to :json

  # Este método actualiza la columna del ganador
  # con su Facebook ID en caso de haber ganado.
  #
  def is_winner?
    if there_are_available_prizes && is_a_valid(params[:code])
      update_attributes_of_prize params[:code], params[:facebook_id]
    else # we don't have prizes to give..
      respond_with ({:respuesta => "Perdió", :codigo => 0}).to_json
    end
  end



  def there_are_available_prizes
    !Prize.find_by_facebook_id("0").nil?
  end

  def is_a_valid code
    letters = code[0..1]
    number = code[2..7].to_i
    if    letters == "AA" && 100001 <= number && number < 120000 then
      return true
    elsif letters == "AB" && 120001 <= number && number < 140000 then
      return true
    elsif letters == "AC" && 140001 <= number && number < 160000 then
      return true
    elsif letters == "AD" && 160001 <= number && number < 180000 then
      return true
    elsif letters == "AE" && 180001 <= number && number < 200000 then
      return true
    elsif letters == "AF" && 200001 <= number && number < 220000 then
      return true
    elsif letters == "AG" && 220001 <= number && number < 240000 then
      return true
    elsif letters == "AH" && 240001 <= number && number < 260000 then
      return true
    elsif letters == "AI" && 260001 <= number && number < 280000 then
      return true
    elsif letters == "AJ" && 280001 <= number && number < 300000 then
      return true
    else
      false
    end
  end

  def update_attributes_of_prize number, facebook_id
    @prize = Prize.find_by_facebook_id("0")
    if !@prize.nil?
      if @prize.update_attributes(:facebook_id => facebook_id, :code => number)
        winner @prize.description
      else
        try_again
      end
    else
      try_again
    end
  end

  def winner prize_description
    if prize_description == "4 entradas"
      @codigo = 1
    else
      @codigo = 2
    end
    respond_with ({:respuesta => prize_description, :codigo => @codigo}).to_json
  end
private
  def try_again
    respond_with ({:respuesta => "Perdió", :codigo => 0}).to_json
  end
end
