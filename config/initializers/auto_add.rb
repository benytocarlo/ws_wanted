Thread.new{
  while true
    begin
      Prize.add_new_prize_entradas
      print "INFO: ACABO DE AGREGAR UN PREMIO\n"
    rescue
      print "INFO: NO ESTOY AGREGANDO PREMIOS\n"
    ensure
      #for i in 0..2
      sleep(1.hours)
      #print "INFO: ESTOY DURMIENDO POR 60 SEGUNDOS\n"
      #end
    end
  end 
}


