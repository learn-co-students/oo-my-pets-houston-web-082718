class Owner
  @@all = []

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.length
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    make_pets_happy(:dogs)
  end

  def play_with_cats
    make_pets_happy(:cats)
  end

  def feed_fish
    make_pets_happy(:fishes)
  end

  def make_pets_happy(type)
    self.pets[type].each do |pet|
      pet.become_happy
    end
  end

  def sell_pets
    self.pets.values.each do |pet_type|
      pet_type.each do |pet|
        pet.become_nervous
      end
      pet_type.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end
