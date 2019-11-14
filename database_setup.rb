require 'json'

begin 
database = File.read("./users.json")
$users = JSON.parse(database)
rescue 
  puts "Unable to connect to database"
  exit 
end 