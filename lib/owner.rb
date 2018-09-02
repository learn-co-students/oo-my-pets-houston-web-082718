# require_relative './spec/fish_spec'
# require_relative './spec/dog_spec'
# require_relative './spec/cat_spec'
# require_relative '../config/environment'

class Owner
attr_reader :species
attr_accessor :pets
  @@owners = []

  def self.all
    @@owners
  end

  def initialize(something)
    @@owners << self
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.reset_all
    @@owners = []
  end

  def self.count
    @@owners.length
  end

  def say_species
    "I am a human."
  end

  def name=(name)
    @name = name
  end

  def name
    @name
  end

  def buy_pets
    @pets
  end

  def buy_fish(name)
    @name = name
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @name = name
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @name = name
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species, pets_array|
      pets_array.each do |pet|
        pet.mood = 'nervous'
      end
    end
    @pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end

# fish.new("bubbles")
