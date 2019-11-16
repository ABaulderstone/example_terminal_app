
while true
  help_selection = Prompt.select("What do you need help with?", { "Installation" => 1, "Flag Options" => 2, "Continue to Daily Horoscope" => 3, "Exit" => 4 })
  system "clear"
  case help_selection
  when 1
    puts Art.asciify("Installation")
    File.open("./resources/installation.txt").each do |line|
      puts line
    end
    puts "\n\n\n"
  when 2
    puts Art.asciify("Flags")
    File.open("./resources/flags.txt").each do |line|
      puts line
    end
    puts "\n\n\n"
  when 3
    break
  when 4
    exit(0)
  end
end
