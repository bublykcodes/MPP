def reverse_polish_notation(expression)
  stack = []          
  operators = []    
  inside_brackets = false


  expression = expression.gsub(/\s+/, '')

  expression.each_char do |char| 
    case char
    when /\d/          
      stack.append(char)
    when '+', '-', '*', '/' 
      if inside_brackets
        operators.append(char)
      else
        while operators.any? && priority(char) <= priority(operators.last)
          stack.append(operators.pop)
        end
        operators.append(char)
      end
    when '(' 
      inside_brackets = true
    when ')' 
      while operators.any? && operators.last != '('
        stack.append(operators.pop)
      end
      operators.pop 
      inside_brackets = false
    end
  end

  while operators.any? 
    stack.append(operators.pop)
  end

  return stack.join(' ')
end

def priority(operator)
  case operator
  when '+', '-'
    return 1 
  when '*', '/'
    return 2 
  else
    return 0 
  end
end

puts reverse_polish_notation("(1 + 2 + 3 * 1 + 2 + 3)/10") 
