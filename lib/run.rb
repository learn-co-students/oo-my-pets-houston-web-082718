require 'pry'
require_relative './cat.rb'
require_relative './dog.rb'
require_relative './fish.rb'
require_relative './owner.rb'

jonny = Owner.new('Jonny')
jonny.buy_dog('Rufus')

# binding.pry
