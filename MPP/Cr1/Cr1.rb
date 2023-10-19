def sort_numbers(numbers, ascending)
    if ascending
      numbers.sort!
    else
      numbers.sort! { |a, b| b <=> a }
    end
  end
  
  puts "Enter a list of numbers separated by spaces:"
  input = gets.chomp
  numbers = input.split.map { |num| num.to_i }
  
  puts "Choose the sorting order:"
  puts "1. Ascending"
  puts "2. Descending"
  
  choice = gets.chomp.to_i
  
  if choice == 1
    sort_numbers(numbers, true)
    puts "Sorted in ascending order: #{numbers.join(', ')}"
  elsif choice == 2
    sort_numbers(numbers, false)
    puts "Sorted in descending order: #{numbers.join(', ')}"
  else
    puts "Invalid choice. Please select 1 for ascending or 2 for descending."
  end
  