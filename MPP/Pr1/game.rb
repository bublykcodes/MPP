names = ['Rock', 'Paper', 'Scissors']

puts 'Your move: 0 - Rock, 1 - Paper, 2 - Scissors'

user_choice = gets.to_i
computer_choice = rand(3)

puts 'Your move: ' + names[user_choice]
puts 'Computer move: ' + names[computer_choice]

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