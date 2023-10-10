def roman_to_int(s)
    roman_map = {
      'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50,
      'C' => 100, 'D' => 500, 'M' => 1000
    }
    
    result = 0
    prev_value = 0
    
    s.reverse.each_char do |char|
      value = roman_map[char]
      
      if value < prev_value
        result -= value
      else
        result += value
      end
      
      prev_value = value
    end
    
    result
  end
  
  def int_to_roman(num)
    roman_map = {
      1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
      100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
      10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I'
    }
    
    roman = ""
    
    roman_map.each do |value, letter|
      while num >= value
        roman += letter
        num -= value
      end
    end
    
    roman
  end
  
  puts "Введіть римське або арабське число (1-3999):"
  input = gets.chomp
  
  if input.match?(/\A\d+\z/)
    num = input.to_i
    if num >= 1 && num < 4000
      roman = int_to_roman(num)
      puts "Римське представлення: #{roman}"
    else
      puts "Введене число не входить в діапазон від 1 до 3999."
    end
  elsif input.match?(/\A[MDCLXVI]+\z/)
    roman = input
    int = roman_to_int(roman)
    puts "Ціле число: #{int}"
  else
    puts "Неправильний формат введення. Введіть або римське, або арабське число."
  end