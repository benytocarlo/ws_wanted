Thread.new{
  while true
    begin
      Prize.add_new_prize_entradas
      print "INFO: SE HA AGREGADO UN PREMIO\n"
    rescue
      print "INFO: NO PUDE AGREGAR UN PREMIO\n"
    ensure
      sleep(1.hours)
    end
  end 
}


