require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_json = JSON.parse(open(url).read)

ingredient_json['drinks'].each do |hash|
  Ingredient.create(name: hash['strIngredient1'])
end
