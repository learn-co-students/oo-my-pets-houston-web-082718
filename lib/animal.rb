class Animal
  attr_reader :name
  attr_accessor :mood

  def initialize(name)
    @name = name
    @mood = "nervous"
  end

  def become_happy
    self.mood = "happy"
  end

  def become_nervous
    self.mood = "nervous"
  end
end
