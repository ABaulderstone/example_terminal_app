require "json"
begin
  database = File.read("db/users.json")
  $users = JSON.parse(database)
  puts "Connected to database"
rescue
  puts "Creating database..."
  File.open("./db/users.json", "w") do |f|
    f.write([].to_json)
  end
end
