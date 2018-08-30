require 'pry'
class Owner
  attr_accessor :name, :pets, :count
  attr_reader :species

  @@all = []

  def initialize(name)
    @pets = {fishes: [], cats: [], dogs: []}
    @name = name
    @species = "human"

    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @count = @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def say_species
      "I am a #{species}."
  end

  def buy_fish(fish_name)
    self.pets[:fishes].push(Fish.new(fish_name))
  end

  def buy_cat(cat_name)
    self.pets[:cats].push(Cat.new(cat_name))
  end

  def buy_dog(dog_name)
    self.pets[:dogs].push(Dog.new(dog_name))
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

  def sell_pets
    self.pets.each do |pet_type, pet_names|
      pet_names.each do |each_pet|
        each_pet.mood = "nervous"
      end
    end
    self.pets = {}
  end

  def list_pets
    fish_count = self.pets[:fishes].size
    dog_count = self.pets[:dogs].size
    cat_count = self.pets[:cats].size
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end

trung = Owner.new("Trung")
trung.buy_fish("Bubble")

#binding.pry