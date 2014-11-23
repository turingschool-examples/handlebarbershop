require 'sinatra/handlebars'

class Handlebarbershop < Sinatra::Base
  helpers Sinatra::Handlebars

  get '/' do
    handlebars :simple, locals: {name: 'Rachel'}
  end

  get '/shopping-list' do
    foods =  [ 'Red apples', 'Green apples', 'Tan bars' ]
    handlebars :iterate, locals: {foods: foods}
  end

  get '/pets' do
    pets = [
      Animal.new('Marley', 'Dog', 6),
      Animal.new('Bucu', 'Cat', 13),
      Animal.new('Baby Elmo', 'Stuffed Animal', 2)
    ]
    handlebars :properties, locals: {pets: pets}
  end

  get '/pet' do
    pet = Animal.new('Marley', 'Dog', 6)
    handlebars :with, locals: {pet: pet}
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