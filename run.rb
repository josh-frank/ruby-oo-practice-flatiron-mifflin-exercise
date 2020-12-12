require_relative "lib/Manager"
require_relative "lib/Employee"
require_relative "lib/Role"
require 'pry'

#Test your code here

marketing = Role.new( "Marketing" )
accounts = Role.new( "Accounts" )
chew_toys = Role.new( "Chew toys" )

gladys = Manager.new( "Gladys", chew_toys, 70 )
marty = Manager.new( "Marty", marketing, 65 )
laura = Manager.new( "Laura", accounts, 67 )

chew_toys.add_employee( "Stella", 0, gladys )
marketing.add_employee( "Josh", 30000, marty )
marketing.add_employee( "David", 30500, marty )
accounts.add_employee( "Diana", 40000, laura )
accounts.add_employee( "Sam", 40500, laura )

binding.pry
puts "done"