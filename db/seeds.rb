Doe.destroy_all
Buck.destroy_all
Junior.destroy_all

doe_list = [
  [ "Betty", "400.0" ],
  [ "Becky", "500.0" ],
  [ "Peggy", "620.0" ],
  [ "Meggy", "740.0" ],
  [ "Leggy", "150.0"],
  [ "Cherry", "270.0"]
]

doe_list.each do |name, price|
  Doe.create!( name: name, price: price )
end

p "Created #{Doe.count} does"

buck_list = [
  [ "Bill", "400.0" ],
  [ "Will", "500.0" ],
  [ "Lill", "620.0" ],
  [ "Chill", "740.0" ],
  [ "Nill", "150.0"],
  [ "Zill", "270.0"]
]

buck_list.each do |name, price|
  Buck.create( name: name, price: price )
end

p "Created #{Buck.count} bucks"

junior_list = [
  [ "Mary", "400.0" ],
  [ "Carrie", "500.0" ],
  [ "Larry", "620.0" ],
  [ "Harry", "740.0" ],
  [ "Quarry", "150.0"],
  [ "Zarry", "270.0"]
]

junior_list.each do |name, price|
  Junior.create( name: name, price: price )
end

p "Created #{Junior.count} juniors"
