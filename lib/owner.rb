require 'pry'





class Owner
  # code goes here
  
  attr_reader :species
  attr_accessor :name, :pets
  
  @@all = []


  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}


    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end 

  def self.count
    all.length
  end 

  def say_species
    "I am a #{species}."
  end 

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end 

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end 

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end 

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = 'happy'
    end
  end 

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    self.pets.each do |type, species|
      species.each do |pet|
        pet.mood = 'nervous'
      end
      self.pets[type] = []
    end
  end 

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end 

end



andrew = Owner.new ('human')

# binding.pry