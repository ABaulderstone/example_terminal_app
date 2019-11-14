require 'json'
require_relative "./database_setup.rb"
puts "Please enter your name"
input = gets.chomp.downcase

$users.each do |user|
  puts user.class  
  if user["name"] == input 
    puts "Hello #{user["name"].upcase}"
    break
  else 
    puts "Could not find #{input}"
  end 
end 
