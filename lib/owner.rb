require 'pry'
require_relative './cat'
require_relative './dog'
require_relative './fish'


class Owner

  @@all = []

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}

    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all =[]
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

  def sell_pets

    pets.each do |pet, type|
      type.each do |animal|
        animal.mood = 'nervous'
      end
    end

    @pets = {:fishes => [], :dogs => [], :cats => []}

  end

end

# graham = Owner.new('human')
# graham.buy_dog("floofers")
# graham.buy_dog("puddles")
#
# graham.sell_pets
#
# binding.pry
