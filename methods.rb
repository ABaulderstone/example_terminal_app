require_relative "./user_model.rb"

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
  session_user = User.new(name, birthday)
  return session_user
end

def find_or_create(name)
  user = find_user(name)
  if user
    session_user = User.new(user["name"], user["birthday"])
    welcome_back(name)
    return session_user
  else
    puts "Looks like we couldn't find #{name}"
    user = create_user
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

def wait_clear
  puts "."
  sleep(1)
  puts "."
  sleep(1)
  puts "."
  sleep(1)
  system "clear"
end

def welcome_back(name)
  puts "Welcome back #{name}"
  wait_clear
end
