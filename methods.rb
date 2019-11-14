def find_user (input)
  found_users =[]
  
  $users.each do |user|  
    if user["name"] == input 
      found_users.push(user)
    end 
  end
  
end 

def create_user
  puts "Enter your name"
  name = gets.chomp.downcase
  puts "Enter your birthday"
  birthday = gets.chomp
  puts "Enter your sign"
  sign = gets.chomp
  user = { 
    "name" => name,
    "birthday" => birthday,
    "sign" => sign, 
    "history" => {}
  }

  $users << user 

  File.open('users.json', 'w') do |f|
    f.write($users.to_json)
  end

end 