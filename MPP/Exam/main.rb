class BoyerMoore
  attr_reader :pattern, :bad_char_skip, :good_suffix_skip

  def initialize(pattern)
    @pattern = pattern
    @bad_char_skip = bad_character_table(pattern)
    @good_suffix_skip = good_suffix_table(pattern)
  end

  def search(text)
    m = pattern.length
    n = text.length
    i = 0
    positions = []  # Додано для збереження позицій входжень

    while i <= n - m
      j = m - 1

      while j >= 0 && pattern[j] == text[i + j]
        j -= 1
      end

      if j < 0
        # Знайдено входження підрядка
        positions << i  # Змінено для збереження позицій входжень
        puts "Знайдено входження підрядка починаючи з позиції #{i}"
        i += m
      else
        bad_char_shift = j - (bad_char_skip[text[i + j].ord] || m)
        good_suffix_shift = good_suffix_skip[j]

        shift = [bad_char_shift, good_suffix_shift].max
        puts "Неспівпадіння на позиції #{i + j}. Зсув на #{shift} позицій."
        i += shift
      end
    end

    if positions.empty?
      puts "Підрядок не знайдено в тексті."
    else
      puts "Знайдено входження підрядка починаючи з позицій #{positions.join(', ')}"
    end
  end

  private

  def bad_character_table(pattern)
    bad_char_skip = {}
    m = pattern.length

    (0..m - 2).each do |i|
      bad_char_skip[pattern[i].ord] = m - 1 - i
    end

    bad_char_skip
  end

  def good_suffix_table(pattern)
    m = pattern.length
    suffixes = Array.new(m, 0)
    f = g = m - 1

    (m - 2).downto(0).each do |i|
      if i > g && suffixes[i + m - 1 - f].nil?
        suffixes[i] = i - g
      else
        g = i
        f = [f, g].min

        while g >= 0 && pattern[g] == pattern[g + m - 1 - f]
          g -= 1
        end

        suffixes[i] = f - g
      end
    end

    suffixes
  end
end

# Приклад використання алгоритму Бойєра-Мура
pattern = "example"
text = "Here is an example of the Boyer-Moore algorithm in action. This is an example text."

boyer_moore = BoyerMoore.new(pattern)
boyer_moore.search(text)