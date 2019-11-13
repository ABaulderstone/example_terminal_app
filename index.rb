require 'json'
require 'json'
database = open("./users.json")
users = JSON.parse(database.read)
puts users[0]["name"]
