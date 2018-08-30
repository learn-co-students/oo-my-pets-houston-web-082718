class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@owner = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}

    @@owner << self
  end

  def self.all
    @@owner
  end

  def self.count
    @@owner.count
  end

  def self.reset_all
    @@owner = []
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish_name)
    fish_class = Fish.new(fish_name)
    self.pets[:fishes] << fish_class
  end

  def buy_cat(cat_name)
    cat_class = Cat.new(cat_name)
    self.pets[:cats] << cat_class
  end

  def buy_dog(dog_name)
    dog_class = Dog.new(dog_name)
    self.pets[:dogs] << dog_class
  end

  def walk_dogs
    @pets[:dogs].each do |dog_object|
      dog_object.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat_object|
      cat_object.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish_object|
      fish_object.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |pet_type, pet_object_array|
      pet_object_array.each do |pet_object|
        pet_object.mood = "nervous"
      end
    end

    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end
end
