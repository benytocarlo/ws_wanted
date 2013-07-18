# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Code.create([
	{:number => "1111AAAA", :status =>0},
	{:number => "2222BBBB", :status =>0},
	{:number => "3333CCCC", :status =>0},
	{:number => "4444DDDD", :status =>0},
	{:number => "5555EEEE", :status =>0},
	{:number => "6666FFFF", :status =>0},
	{:number => "7777GGGG", :status =>0},
	{:number => "8888HHHH", :status =>0},
	{:number => "9999IIII", :status =>0}
])

Prize.create([
  {:description => "4 entradas", :facebook_id =>0}
])