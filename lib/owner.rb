class Owner
  # code goes here
  @@OWNERS = []
  attr_reader :species
  attr_accessor :name, :pets
  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@OWNERS << self

  end


  def say_species
    "I am a #{self.species}."
  end

  def self.reset_all
    @@OWNERS.clear
  end

  def self.all
  @@OWNERS
  end

  def self.count
    @@OWNERS.size
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
    pets[:dogs].each do |dogs|
      dogs.mood = 'happy'
    end
  end

  def play_with_cats
    pets[:cats].each do |cats|
      cats.mood = 'happy'
    end
  end

  def feed_fish
    pets[:fishes].each do |fishes|
      fishes.mood = 'happy'
    end
  end

  def sell_pets
    pets.each do |pet, type|
      type.each do |animal|
        # binding.pry
        animal.mood = 'nervous'
      end
      type.clear
    end
  end



  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end
end


# john = Owner.new('human')
# john.buy_cat('dug')
# john.buy_dog('ralf')
#
# john.sell_pets
