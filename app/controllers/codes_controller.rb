#coding: utf-8
class CodesController < ApplicationController
  respond_to :json

  def update_prize_with_winner 
    if update_attributes_of_code params[:code].to_s, params[:facebook_id].to_s
      update_attributes_of_prize params[:code].to_s, params[:facebook_id].to_s
    else
      try_again
    end
  end

private

  def update_attributes_of_code number, facebook_id
    @code = Code.find_by_number number
    if !@code.nil? 
      if @code.mark_off
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def update_attributes_of_prize number, facebook_id
    @code = Code.find_by_number number
    @prize = Prize.find_by_facebook_id("0")
    if !@prize.nil?
      if @prize.update_attributes(:facebook_id => facebook_id, :code_id => @code.id)
        winner @prize.description
      else
        try_again
      end
    else
      try_again
    end
  end

  def winner prize_description
    respond_with ({:respuesta => prize_description, :codigo => 2}).to_json
  end

  def try_again
    respond_with ({:respuesta => "Perdió", :codigo => 0}).to_json
  end
end
