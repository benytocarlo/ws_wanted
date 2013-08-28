#coding: utf-8
class MemesController < ApplicationController
  respond_to :json
  require 'net/ftp'
  require 'net/http'
  require 'RMagick'
  
  # Este método imprime una imagen y la guarda en el FTP de Memefactory
  def print_meme
    @dir_imagen = params[:idmeme]
    #direccion_imagen = 'http://appdigital.cl/test_jquery/edit_image/screenshot2.php?id_insert=' + @dir_imagen.to_s
    direccion_imagen = 'http://www.google.com/fonts'
    kit = IMGKit.new(direccion_imagen, :quality => 100)
    @originalimage = kit.to_img(:jpg)
    //
    @originalimage = Magick::Image.from_blob(@originalimage).first
    @originalimage.crop!(0, 250, 810, 850)
    #@originalimage.resize_to_fit!(810, 600)
    
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
