class Handlebarbershop < Sinatra::Base

  get '/' do
    name = "Jennifer Johnson"
    erb :index, locals: { name: name }
  end

  get '/shopping-list' do
    foods =  [ 'Red apples', 'Green apples', 'Yellow apples' ]
    erb :shopping_list, locals: { foods: foods }
  end

  get '/pets' do
    pets = [
      Animal.new('Marley', 'Dog', 6),
      Animal.new('Bucu', 'Cat', 13),
      Animal.new('Ollie', 'Elephant', 2)
    ]
    erb :pets, locals: { pets: pets }
  end

  get '/pet' do
    pet = Animal.new('Joe', 'Red Panda', 3)
    erb :pet, locals: { pet: pet }
  end

  run! if app_file == $0
end

class Animal
  attr_reader :name, :species, :age
  def initialize(name, species, age)
    @name = name
    @species = species
    @age = age
  end
end
