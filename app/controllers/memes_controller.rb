#coding: utf-8
class MemesController < ApplicationController
  respond_to :json
  require 'net/ftp'
  require 'net/http'
  require 'RMagick'
  
  # Este método imprime una imagen y la guarda en el FTP de Memefactory
  def print_meme
    @dir_imagen = params[:idmeme]
    direccion_imagen = 'http://appdigital.cl/test_jquery/edit_image/screenshot2.php?id_insert=' + @dir_imagen.to_s
    kit = IMGKit.new(direccion_imagen)
    @originalimage = kit.to_img(:jpg)
    //
    @originalimage = Magick::Image.from_blob(@originalimage).first
    @originalimage.crop!(params[:x1].to_i, params[:y1].to_i, params[:w].to_i, params[:h].to_i)
    @originalimage.resize_to_fit!(810, 600)
    
    file = StringIO.open(@originalimage.to_blob)
    #file = @originalimage
    #@originalimage.write(file)
    ftp = Net::FTP.new('190.196.67.254')
    ftp.passive = true
    ftp.login('heroku@miapp.cl', 'heroku')
    ftp.storbinary("STOR " + "memefactory/" + params[:idmeme] + "_image.jpg", StringIO.new(file.read), Net::FTP::DEFAULT_BLOCKSIZE)
    ftp.quit
    respond_with ({ :respuesta => "1" })
  end
end