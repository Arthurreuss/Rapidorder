# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Allergy.destroy_all
Allergy.create!(name: "Celery", url: "https://get.apicbase.com/wp-content/uploads/2020/04/celery.svg")
Allergy.create(name: "Gluten", url: "https://get.apicbase.com/wp-content/uploads/2020/04/cereal.svg")
Allergy.create(name: "Crustaceans", url: "https://get.apicbase.com/wp-content/uploads/2020/04/crustaceans.svg")
Allergy.create(name: "Egg", url: "https://get.apicbase.com/wp-content/uploads/2020/04/egg.svg")
Allergy.create(name: "Fish", url: "https://get.apicbase.com/wp-content/uploads/2020/04/fish.svg")
Allergy.create(name: "Lupin", url: "https://get.apicbase.com/wp-content/uploads/2020/04/lupin.svg")
Allergy.create(name: "Peanuts", url: "https://get.apicbase.com/wp-content/uploads/2020/04/peanuts.svg")
Allergy.create(name: "Soya Beans", url: "https://get.apicbase.com/wp-content/uploads/2020/04/soya-beans.svg")
Allergy.create(name: "Cow Milk", url: "https://get.apicbase.com/wp-content/uploads/2020/04/cow-milk.svg")
Allergy.create(name: "Molluscs", url: "https://get.apicbase.com/wp-content/uploads/2020/04/molluscs.svg")
Allergy.create(name: "Mustard", url: "https://get.apicbase.com/wp-content/uploads/2020/04/mustard.svg")
Allergy.create(name: "Tree Nuts", url: "https://get.apicbase.com/wp-content/uploads/2020/04/tree-nuts.svg")
Allergy.create(name: "Sesame Seeds", url: "https://get.apicbase.com/wp-content/uploads/2020/04/sesame-seeds.svg")
Allergy.create(name: "Sulphur Dioxide", url: "https://get.apicbase.com/wp-content/uploads/2020/04/sulphur-dioxide.svg")

# Order.destroy_all
# Product.destroy_all
# Restaurant.destroy_all
# User.destroy_all

user = User.create(first_name: "Massimo", last_name: "Russo", password: "123456", email: "massimorussow@gmail.com")

file = File.open(File.join(__dir__, 'images_seed/restaurant.jpg'))
restaurant = Restaurant.create(name: 'Ginos', description: 'Traditional Italien Restaurant since 1965', address: 'Doctor Izquierdo 70', user: user)
restaurant.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless restaurant.save
  p restaurant.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/pizzac.jpg'))
category = Category.new(name: "Pizza", restaurant_id: 1, product_type: "Meal")
category.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category.save
  p category.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/pastac.jpg'))
category = Category.new(name: "Pasta", restaurant_id: 1, product_type: "Meal")
category.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category.save
  p category.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/tapasc.jpg'))
category = Category.new(name: "Tapas", restaurant_id: 1, product_type: "Meal")
category.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category.save
  p category.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/burgerc.jpg'))
category = Category.new(name: "Burger", restaurant_id: 1, product_type: "Meal")
category.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category.save
  p category.errors.messages
end

category = Category.create(name: "Softdrink", restaurant_id: 1, product_type: "Drink")
category = Category.create(name: "Cocktail", restaurant_id: 1, product_type: "Drink")
category = Category.create(name: "Wine", restaurant_id: 1, product_type: "Drink")
category = Category.create(name: "Beer", restaurant_id: 1, product_type: "Drink")

file = File.open(File.join(__dir__, './images_seed/pizzamargarita.jpg'))
#file = file.read

#1
product = Product.new(
  name: 'Pizza Margherita',
  price: 12,
  description: "Pizza with mozarella and basil",
  category_id: 1,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/pepperonipizza.jpg'))
#file = file.read

#2
product = Product.new(
  name: 'Pizza Pepperoni',
  price: 13,
  description: "Pizza with mozzarella and pepperoni",
  category_id: 1,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/quattroformaggi.jpg'))
#file = file.read

#3
product = Product.new(
  name: 'Pizza Quatro Formaggi',
  price: 14,
  description: "Pizza with four types of cheese",
  category_id: 1,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/pizzaprosciutto.jpg'))
#file = file.read

#4
product = Product.new(
  name: 'Pizza Prosciutto e Funghi',
  price: 13,
  description: "Pizza with mozzarella, ham and mushrooms",
  category_id: 1,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/mahou.jpg'))
#file = file.read

#5
product = Product.new(
  name: 'Mahou',
  price: 3,
  description: "Light Spanish beer",
  category_id: 8,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/heineken.jpg'))
#file = file.read

#6
product = Product.new(
  name: 'Heineken',
  price: 2,
  description: "Very light German beer",
  category_id: 8,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/desperados.jpg'))
#file = file.read

#7
product = Product.new(
  name: 'Desperados',
  price: 4,
  description: "Beer with tequile",
  category_id: 8,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/budweiser.jpg'))
#file = file.read

#8
product = Product.new(
  name: 'Budweiser',
  price: 2,
  description: "Bad American beer",
  category_id: 8,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/carbonara.jpg'))
#file = file.read

#9
product = Product.new(
  name: 'Spaguetti carbonara',
  price: 15,
  description: "Spaguetti with bacon, egg and cheese",
  category_id: 2,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/bolognese.jpg'))
#file = file.read

#10
product = Product.new(
  name: 'Tagliatelle alla bolognese',
  price: 14,
  description: "Tagliatelle with beef, tomato and parmesan cheese",
  category_id: 2,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/pesto.jpg'))
#file = file.read

#11
product = Product.new(
  name: 'Fusilli al pesto',
  price: 15,
  description: "Macaroni with pesto sauce and parmesan cheese",
  category_id: 2,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/gnocchi.jpg'))
#file = file.read

#12
product = Product.new(
  name: 'Gnocchi alla sorrentina',
  price: 16,
  description: "Gnocchi with tomato sauce, mozzarella and basil",
  category_id: 2,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/glassrioja.jpg'))
    #file = file.read

#13
product = Product.new(
  name: 'Glass of red wine',
  price: 5,
  description: "Glass of Ramon Bilbao",
  category_id: 7,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/whitewine.jpg'))
#file = file.read

#14
product = Product.new(
  name: 'Glass of white wine',
  price: 6,
  description: "Glass of Jose Pariente",
  category_id: 7,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/rosewine.jpg'))
#file = file.read

#15
product = Product.new(
  name: 'Glass of rose wine',
  price: 8,
  description: "Glass of Marques de Murrieta",
  category_id: 7,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/champagne.jpg'))
#file = file.read

#16
product = Product.new(
  name: 'Glass of champagne',
  price: 9,
  description: "Glass of Moet & Chandon ",
  category_id: 7,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/tortillapatata.jpg'))
      #file = file.read

#17
product = Product.new(
  name: 'Tortilla de patata',
  price: 16,
  description: "The best tortilla in Madrid",
  category_id: 3,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/croquetas.jpg'))
#file = file.read

#18
product = Product.new(
  name: 'Croquetas',
  price: 12,
  description: '8 ham croquetas',
  category_id: 3,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/patatasbravas.jpg'))
#file = file.read

#19
product = Product.new(
  name: 'Patatas bravas',
  price: 8,
  description: 'Potatoes with sauce',
  category_id: 3,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/calamares.jpg'))
#file = file.read

#20
product = Product.new(
  name: 'Calamares',
  price: 18,
  description: 'Fried calamari',
  category_id: 3,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/burgerpic.jpg'))
#file = file.read

#21
product = Product.new(
  name: 'Cheeseburger',
  price: 14,
  description: "Burger with cheese and bacon",
  category_id: 4,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/doublecheeseburger.jpg'))
#file = file.read

#22
product = Product.new(
  name: 'Double Bacon Cheeseburger',
  price: 14,
  description: "Two grilled patties with cheese and bacon",
  category_id: 4,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/eggburger.jpg'))
#file = file.read

#23
product = Product.new(
  name: 'Eggburger',
  price: 14,
  description: "Burger with egg and avocado",
  category_id: 4,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/veggieburger.jpg'))
#file = file.read

#24
product = Product.new(
  name: 'Veggie Burger',
  price: 14,
  description: "Burger with fake meat, cheese, lettuce and tomato",
  category_id: 4,
  product_type: 'Meal',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/cocacola.jpg'))
#file = file.read

#25
product = Product.new(
  name: 'Coca-cola',
  price: 2,
  description: "Cocacola",
  category_id: 5,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
  p product.errors.messages
end

file = File.open(File.join(__dir__, './images_seed/sprite.jpg'))
#file = file.read

#26
product = Product.new(
  name: 'Sprite',
  price: 2,
  description: 'Sprite',
  category_id: 5,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/fanta.jpg'))
#file = file.read

#27
product = Product.new(
  name: 'Fanta',
  price: 2,
  description: 'Lemon fanta',
  category_id: 5,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/aquarius.jpg'))
#file = file.read

#28
product = Product.new(
  name: 'Aquarius',
  price: 2,
  description: 'Lemon aquarius',
  category_id: 5,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/mojito.jpg'))
#file = file.read

#29
product = Product.new(
  name: 'Mojito',
  price: 11,
  description: "Rum, lime juice, cane sugar and mint",
  category_id: 6,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/negroni.jpg'))
#file = file.read

#30
product = Product.new(
  name: 'Negroni',
  price: 12,
  description: "Gin, campari and vermouth",
  category_id: 6,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/daiquiri.jpg'))
#file = file.read

#31
product = Product.new(
  name: 'Daiquiri',
  price: 12,
  description: "White rum, lime juice and syrup",
  category_id: 6,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/aperolspritz.jpg'))
#file = file.read

#32
product = Product.new(
  name: 'Aperol Spritz',
  price: 10,
  description: "Prosecco, Aperol and soda",
  category_id: 6,
  product_type: 'Drink',
  restaurant_id: 1
)
  product.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product.save
    p product.errors.messages
  end
# {
#   name: 'Mahou',
#   price: '4',
#   description: "The best spanish beer",
#   category: 'Beer',
#   product_type: 'Drink',
#   restaurant_id: '1',
#   photo: {  File.open('downloads/mahou.jpg')
#     product.photo.attach(io: file, filename: "mahou.jpg", content_type: "image/jpg") product.save}
# },
# {
#   name: 'Cheeseburguer',
#   price: '15',
#   description: "With cheese, lettuce and tomato",
#   category: 'Burguer',
#   product_type: 'Meal',
#   restaurant_id: '1',
#   photo: {  File.open('downloads/burgerpic.jpg'),
#     product.photo.attach(io: image, filename: "burgerpic.jpg", content_type: "image/jpg")}
# },
# ])
ProductAllergy.create(
  product_id: 1,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 1,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 2,
  allergy_id: 1
)

ProductAllergy.create(
  product_id: 2,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 3,
  allergy_id: 1
)

ProductAllergy.create(
  product_id: 3,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 4,
  allergy_id: 1
)

ProductAllergy.create(
  product_id: 4,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 5,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 5,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 6,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 6,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 7,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 7,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 8,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 8,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 9,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 9,
  allergy_id: 4
)

ProductAllergy.create(
  product_id: 9,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 10,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 10,
  allergy_id: 4
)

ProductAllergy.create(
  product_id: 10,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 11,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 11,
  allergy_id: 4
)

ProductAllergy.create(
  product_id: 11,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 12,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 12,
  allergy_id: 4
)

ProductAllergy.create(
  product_id: 12,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 13,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 14,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 15,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 16,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 17,
  allergy_id: 4
)

ProductAllergy.create(
  product_id: 18,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 18,
  allergy_id: 9
)

ProductAllergy.create(
  product_id: 19,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 20,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 20,
  allergy_id: 3
)

ProductAllergy.create(
  product_id: 20,
  allergy_id: 4
)

ProductAllergy.create(
  product_id: 20,
  allergy_id: 5
)

ProductAllergy.create(
  product_id: 21,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 21,
  allergy_id: 8
)

ProductAllergy.create(
  product_id: 21,
  allergy_id: 11
)

ProductAllergy.create(
  product_id: 21,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 22,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 22,
  allergy_id: 8
)

ProductAllergy.create(
  product_id: 22,
  allergy_id: 211
)

ProductAllergy.create(
  product_id: 22,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 23,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 23,
  allergy_id: 8
)

ProductAllergy.create(
  product_id: 23,
  allergy_id: 11
)

ProductAllergy.create(
  product_id: 23,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 24,
  allergy_id: 2
)

ProductAllergy.create(
  product_id: 24,
  allergy_id: 7
)

ProductAllergy.create(
  product_id: 24,
  allergy_id: 8
)

ProductAllergy.create(
  product_id: 24,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 29,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 30,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 31,
  allergy_id: 14
)

ProductAllergy.create(
  product_id: 32,
  allergy_id: 14
)
