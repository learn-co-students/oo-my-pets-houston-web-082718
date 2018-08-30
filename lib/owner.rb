class Owner
  # code goes here
  attr_reader :species
  attr_accessor :pets, :count, :name

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats =>[]}
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.reset_all
    self.all = []
  end

  def self.count
    @@count = all.size
  end

  def self.all
    @@all
  end

  def self.all=(value)
    @@all = value
  end

  def buy_fish(fish)
    new_fish = Fish.new(fish)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat)
    self.pets[:cats] << new_cat
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog)
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

  def sell_pets
    self.pets.each do|pet_type, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
    end
    self.pets = []
  end

  def list_pets
    "I have #{self.pets[:fishes].size} fish, #{self.pets[:dogs].size} dog(s), and #{self.pets[:cats].size} cat(s)."
  end

end
