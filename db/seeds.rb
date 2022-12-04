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

Order.destroy_all
Product.destroy_all
Restaurant.destroy_all
User.destroy_all

User.create(first_name: "Massimo", last_name: "Russo", password: "123456", email: "massimorussow@gmail.com")
Restaurant.create(name: 'Ginos', description: 'Traditional Italien Restaurant since 1965', address: 'Doctor Izquierdo 70', user_id: 1)

file = File.open(File.join(__dir__, './images_seed/Pizza-C.jpg'))
category = Category.create(name: "Pizza", restaurant_id: 1, product_type: "Meal")
category.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category.save
  p category.errors.messages
end

file = File.open(File.join(__dir__, './images_seed/Pasta-C.jpg'))
category = Category.create(name: "Pasta", restaurant_id: 1, product_type: "Meal")
category.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category.save
  p category.errors.messages
end

file = File.open(File.join(__dir__, './images_seed/Tapas-C.jpg'))
category = Category.create(name: "Tapas", restaurant_id: 1, product_type: "Meal")
category.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category.save
  p category.errors.messages
end

file = File.open(File.join(__dir__, './images_seed/Burger-C.jpg'))
category = Category.create(name: "Burger", restaurant_id: 1, product_type: "Meal")
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

product = Product.new(
  name: 'Pizza Margarita',
  price: 12,
  description: "The best pizza in Madrid",
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

file = File.open(File.join(__dir__, './images_seed/carbonara.jpg'))
  #file = file.read

product = Product.new(
  name: 'Spaguetti Carbonara',
  price: 16,
  description: "Spaguetti with bacon, egg and cheese",
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

product = Product.new(
  name: 'Glass of wine',
  price: 5,
  description: "Glass of La Rioja wine",
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

file = File.open(File.join(__dir__, './images_seed/cocacola.jpg'))
#file = file.read

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
