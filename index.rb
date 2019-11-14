require 'json'
require_relative "./database_setup.rb"
puts "Please enter your name"
input = gets.chomp.downcase




def find_user (input)
  $users.each do |user|  
    if user["name"] == input 
      return user 
    end 
  end
  "Could not find user #{input}"
end 

puts find_user(input)


