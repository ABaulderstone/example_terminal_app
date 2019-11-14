require 'json'

begin 
database = open("./users.json")
$users = JSON.parse(database.read)
rescue 
  puts "Unable to connect to database"
  exit 
end 