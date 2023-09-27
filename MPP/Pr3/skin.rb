class Character
  def description
    "Базовий персонаж"
  end
end


class SkinDecorator < Character
  def initialize(character, skin)
    @character = character
    @skin = skin
  end

  def description
    "#{@character.description}, Скін: #{@skin}"
  end
end


character = Character.new


character_with_skin1 = SkinDecorator.new(character, "Скін 1")
character_with_skin2 = SkinDecorator.new(character, "Скін 2")


puts character_with_skin1.description 
puts character_with_skin2.description 
