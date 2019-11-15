require_relative "./user_model.rb"

def find_user(input)
  $users.each do |user|
    if user["name"] == input
      return user
    end
  end
  return nil
end

def create_user(name)
  unless validated_yes_or_no("Your name is #{name.capitalize}, right?")
    puts "Enter your name:"
    name = gets.chomp.downcase
  end

  puts "Enter your birthday"
  birthday = get_valid_birthday
  session_user = User.new(name, birthday, {})
  session_user.add_to_users
  return session_user
end

def find_or_create(name)
  user = find_user(name)
  if user
    session_user = User.new(user["name"], user["birthday"], user["history"])
    welcome_back(name)
    return session_user
  else
    puts "Looks like we couldn't find #{name.capitalize}"
    puts ""
    wait_clear
    if validated_yes_or_no("Create new user?")
      user = create_user(name)
    else
      exit(0)
    end
  end
end

def get_valid_birthday
  puts "Please enter your birthday in DD/MM/YYYY format"
  dob = gets.chomp
  until !!dob[/\d{2}\/\d{2}\/\d{4}/]
    puts "Please enter your birthday in DD/MM/YYYY format".colorize(:red)
    dob = gets.chomp
  end
  return dob
end

def validated_yes_or_no(message)
  puts message
  input = gets.chomp.downcase.chars.first
  until input == "y" || input == "n"
    puts "Please enter either (y)es or (n)o".colorize(:red)
    puts message
    input = gets.chomp.downcase.chars.first
  end
  if input == "y"
    return true
  elsif input == "n"
    return false
  end
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

def display_horoscope(sign, date, data)
  system "clear"
  puts Art.asciify("#{sign} : #{date}")
  puts
  puts
  puts data
end

def welcome_back(name)
  puts "Welcome back #{name.capitalize}"
  puts "Fetching your history"
  wait_clear
end

def welcome_message(user)
  system "clear"
  puts Art.asciify("#{user.name.capitalize} - #{user.sign}")
end
