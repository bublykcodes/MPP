names = {Rock: 0, Paper: 1, Scissors: 2}

user_choice = names[ARGV[0].to_sym] 
computer_choice = names[ARGV[1].to_sym]

puts "Your move: #{user_choice} " 
puts "Computer move: #{computer_choice}" 

if user_choice == computer_choice
  puts 'Draw'
elsif user_choice == 0 && computer_choice == 1
  puts 'Victory'
elsif user_choice == 1 && computer_choice == 2
  puts 'Victory'
elsif user_choice == 2 && computer_choice == 0
  puts 'Victory'
else
  puts 'Defeat'
end 