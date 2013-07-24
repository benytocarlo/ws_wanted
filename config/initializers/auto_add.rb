=begin
Thread.new{
  while true
    Prize.add_new_prize_entradas
    sleep 600.0
  end 
}
=end