#coding: utf-8
Prize.create([
  {:description => "4 entradas", :facebook_id =>0}
])
# Códigos AA
#start = Time.now


#@codes = Array.new 
#
#num = 100001
#while num < 120000 do
#  @codes << Code.new(:number => "AA" + num.to_s, :status => 0)
#  num += 1
#end

#Code.create @codes

=begin

num = 120001
while num < 140000 do
  @codes << Code.new(:number => "AB" + num.to_s, :status => 0)
  num += 1
end
# Códigos AC
num = 140001
while num < 160000 do
  @codes << Code.new(:number => "AC" + num.to_s, :status => 0)
  num += 1
end
# Códigos AD
num = 160001
while num < 180000 do
  @codes << Code.new(:number => "AD" + num.to_s, :status => 0)
  num += 1 
end
# Códigos AE
num = 180001
while num < 200000 do
  @codes << Code.new(:number => "AE" + num.to_s, :status => 0)
  num += 1
end
# Códigos AF
num = 200001
while num < 220000 do
  @codes << Code.new(:number => "AF" + num.to_s, :status => 0)
  num += 1 
end
# Códigos AG
num = 220001
while num < 240000 do
  @codes << Code.new(:number => "AG" + num.to_s, :status => 0)
  num += 1
end
# Códigos AH
num = 240001
while num < 260000 do
  @codes << Code.new(:number => "AH" + num.to_s, :status => 0)
  num += 1
end
# Códigos AI
num = 260001
while num < 280000 do
  @codes << Code.new(:number => "AI" + num.to_s, :status => 0)
  num += 1 
end
# Códigos AJ
num = 280001
while num < 300000 do
  @codes << Code.new(:number => "AJ" + num.to_s, :status => 0)
  num += 1
end
=end











#Code.import @codes
=begin
=end



num = 100001
while num < 120000 do
  Code.create(:number => "AA" + num.to_s, :status => 0)
  num += 1
end

# Códigos AB
num = 120001
while num < 140000 do
  Code.create(:number => "AB" + num.to_s, :status => 0)
  num += 1
end
# Códigos AC
num = 140001
while num < 160000 do
  Code.create!(:number => "AC" + num.to_s, :status => 0)
  num += 1
end
# Códigos AD
num = 160001
while num < 180000 do
  Code.create!(:number => "AD" + num.to_s, :status => 0)
  num += 1 
end
# Códigos AE
num = 180001
while num < 200000 do
  Code.create!(:number => "AE" + num.to_s, :status => 0)
  num += 1
end
# Códigos AF
num = 200001
while num < 220000 do
  Code.create!(:number => "AF" + num.to_s, :status => 0)
  num += 1 
end
# Códigos AG
num = 220001
while num < 240000 do
  Code.create!(:number => "AG" + num.to_s, :status => 0)
  num += 1
end
# Códigos AH
num = 240001
while num < 260000 do
  Code.create!(:number => "AH" + num.to_s, :status => 0)
  num += 1
end
# Códigos AI
num = 260001
while num < 280000 do
  Code.create!(:number => "AI" + num.to_s, :status => 0)
  num += 1 
end
# Códigos AJ
num = 280001
while num < 300000 do
  Code.create!(:number => "AJ" + num.to_s, :status => 0)
  num += 1
end
=begin
=end

#end_time = Time.now

#total = end_time - start


#print "El tiempo de ejecución fue de: #{total} segundos\n"