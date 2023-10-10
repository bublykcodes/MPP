def checker(pie)
    pie.each do |row|
      return false if row.count("o") != 1
    end
    true
  end
  
  def get_pie_info(pie)
    n = pie.map { |row| row.count("o") }.sum
    [n, pie[0].length, pie.length]
  end
  
  def easy_horizontal_way_to_cut(pie, n, height)
    pie.each_slice(height / n).map { |slice| slice.join("\n") }
  end
  
  def easy_vertical_way_to_cut(pie, n, width)
    col_width = width / n
    (0...n).map do |c|
      pie.map { |row| row[c * col_width, col_width] }.join("\n")
    end
  end
  
  pie = [
    ".o......",
    "......o.",
    "....o...",
    "..o.....",
  ]
  
  n, width, height = get_pie_info(pie)  
  answer = []
  
  if width * height % n == 0
    if height >= n
      horizontal = easy_horizontal_way_to_cut(pie, n, height)
      puts "Easy horizontal result: #{horizontal}"
      answer << horizontal if checker(horizontal)
    end
    vertical = easy_vertical_way_to_cut(pie, n, width)
    puts "Easy vertical result: #{vertical}"
    answer << vertical if checker(vertical)
  else
    puts "Hard way"
  end
  
  puts "Answer: #{answer}"