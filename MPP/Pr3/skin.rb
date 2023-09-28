class Soldier
  def initialize(name)
    @name = name
  end

  def description
    "Солдат #{@name}"
  end
end

class CamouflageDecorator < Soldier
  def initialize(soldier, camouflage)
    super(soldier.description)
    @soldier = soldier
    @camouflage = camouflage
  end

  def description
    @soldier.description + " в #{@camouflage} камуфляжі"
  end
end

class BodyArmorDecorator < Soldier
  def initialize(soldier)
    super(soldier.description)
    @soldier = soldier
  end

  def description
    @soldier.description + ", в бронежилеті"
  end
end

class BackpackDecorator < Soldier
  def initialize(soldier)
    super(soldier.description)
    @soldier = soldier
  end

  def description
    @soldier.description + ", з рюкзаком"
  end
end

soldier = Soldier.new('Джон')
soldier = CamouflageDecorator.new(soldier, 'Піксель')

soldier_with_armor = BodyArmorDecorator.new(soldier)

soldier_with_backpack = BackpackDecorator.new(soldier_with_armor)

puts soldier_with_backpack.description

another_soldier = Soldier.new('Майкл')
another_soldier = CamouflageDecorator.new(another_soldier, 'Мультикам')

another_soldier_with_armor = BodyArmorDecorator.new(another_soldier)

another_soldier_with_backpack = BackpackDecorator.new(another_soldier_with_armor)

puts another_soldier_with_backpack.description