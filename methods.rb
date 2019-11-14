def find_user(input)
  $users.each do |user|
    if user["name"] == input
      return user
    end
  end
  return nil
end

def create_user
  puts "Enter your name"
  name = gets.chomp.downcase
  puts "Enter your birthday"
  birthday = get_valid_birthday
  puts "Enter your sign"
  sign = gets.chomp
end

def find_or_create(input)
  user = find_user(input)

  if user
    return User.new(user["name"], user["birthday"], user["sign"], user["history"])
  else
    create_user
  end
end

def get_valid_birthday
  puts "Please enter your birthday in DD/MM/YYYY format"
  dob = gets.chomp
  until !!dob[/\d{2}\/\d{2}\/\d{4}/]
    puts "Please enter your birthday in DD/MM/YYYY format"
    dob = gets.chomp
  end
  return dob
end
