def generate_password(length)
  characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  password = ''

  length.times do
    random_index = rand(characters.length)
    password << characters[random_index]
  end

  password
end

puts "Enter the desired password length:"
password_length = gets.chomp.to_i

if password_length > 0
  password = generate_password(password_length)
  puts "Generated password: #{password}"
else
  puts "Invalid password length. Please enter a positive integer."
end
