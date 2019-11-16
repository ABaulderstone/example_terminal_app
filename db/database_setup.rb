require "json"

begin
  database = File.read("./users.json")
  $users = JSON.parse(database)
  puts "Connected to database"
rescue
  puts "Unable to connect to database"
  exit
end
