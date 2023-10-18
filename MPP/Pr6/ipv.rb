def is_ipv4?(str)

  parts = str.split(".")

  return false unless parts.length == 4


  parts.each do |part|
    return false unless part.match(/^\d+$/)


    num = part.to_i
    return false unless num >= 0 && num <= 255
  end

  return true
end

puts is_ipv4?("192.168.1.1") #true
puts is_ipv4?("256.0.0.1")   #false
puts is_ipv4?("0.0.0.0")     #true
puts is_ipv4?("12.34.56.78") #true
