
while true
  help_selection = Prompt.select("What do you need help with?", { "Installation" => 1, "Flag Options" => 2, "Continue to Daily Horoscope" => 3, "Exit" => 4 })
  system "clear"
  case help_selection
  when 1
    puts "Instructions go here"
  when 2
    puts "Flag Options go here"
  when 3
    break
  when 4
    exit(0)
  end
end
