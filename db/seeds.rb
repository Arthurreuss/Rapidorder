# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Allergy.destroy_all
allergy1 = Allergy.create!(name: "Celery", url: "https://get.apicbase.com/wp-content/uploads/2020/04/celery.svg")
allergy2 = Allergy.create(name: "Gluten", url: "https://get.apicbase.com/wp-content/uploads/2020/04/cereal.svg")
allergy3 = Allergy.create(name: "Crustaceans", url: "https://get.apicbase.com/wp-content/uploads/2020/04/crustaceans.svg")
allergy4 = Allergy.create(name: "Egg", url: "https://get.apicbase.com/wp-content/uploads/2020/04/egg.svg")
allergy5 = Allergy.create(name: "Fish", url: "https://get.apicbase.com/wp-content/uploads/2020/04/fish.svg")
allergy6 = Allergy.create(name: "Lupin", url: "https://get.apicbase.com/wp-content/uploads/2020/04/lupin.svg")
allergy7 = Allergy.create(name: "Peanuts", url: "https://get.apicbase.com/wp-content/uploads/2020/04/peanuts.svg")
allergy8 = Allergy.create(name: "Soya Beans", url: "https://get.apicbase.com/wp-content/uploads/2020/04/soya-beans.svg")
allergy9 = Allergy.create(name: "Cow Milk", url: "https://get.apicbase.com/wp-content/uploads/2020/04/cow-milk.svg")
allergy10 = Allergy.create(name: "Molluscs", url: "https://get.apicbase.com/wp-content/uploads/2020/04/molluscs.svg")
allergy11 = Allergy.create(name: "Mustard", url: "https://get.apicbase.com/wp-content/uploads/2020/04/mustard.svg")
allergy12 = Allergy.create(name: "Tree Nuts", url: "https://get.apicbase.com/wp-content/uploads/2020/04/tree-nuts.svg")
allergy13 = Allergy.create(name: "Sesame Seeds", url: "https://get.apicbase.com/wp-content/uploads/2020/04/sesame-seeds.svg")
allergy14 = Allergy.create(name: "Sulphur Dioxide", url: "https://get.apicbase.com/wp-content/uploads/2020/04/sulphur-dioxide.svg")

Order.destroy_all
Product.destroy_all
Restaurant.destroy_all
User.destroy_all
ProductAllergy.destroy_all
Table.destroy_all
Category.destroy_all
Review.destroy_all

user = User.create(first_name: "Massimo", last_name: "Russo", password: "123456", email: "massimorussow@gmail.com")

file = File.open(File.join(__dir__, 'images_seed/restaurant.jpg'))
restaurant1 = Restaurant.create(name: 'Ginos', description: 'Traditional Italien Restaurant since 1965', address: 'Doctor Izquierdo 70', user: user)
restaurant1.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless restaurant1.save
  p restaurant1.errors.messages
end

Table.create(name: "1", restaurant: restaurant1)
Table.create(name: "2", restaurant: restaurant1)
Table.create(name: "3", restaurant: restaurant1)
Table.create(name: "4", restaurant: restaurant1)
Table.create(name: "5", restaurant: restaurant1)
Table.create(name: "6", restaurant: restaurant1)
Table.create(name: "7", restaurant: restaurant1)
Table.create(name: "8", restaurant: restaurant1)
Table.create(name: "9", restaurant: restaurant1)
Table.create(name: "10", restaurant: restaurant1)

file = File.open(File.join(__dir__, 'images_seed/pizzac.jpg'))
category1 = Category.new(name: "Pizza", restaurant: restaurant1, product_type: "Meal")
category1.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category1.save
  p category1.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/pastac.jpg'))
category2 = Category.new(name: "Pasta", restaurant: restaurant1, product_type: "Meal")
category2.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category2.save
  p category2.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/tapasc.jpg'))
category3 = Category.new(name: "Tapas", restaurant: restaurant1, product_type: "Meal")
category3.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category3.save
  p category3.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/burgerc.jpg'))
category4 = Category.new(name: "Burger", restaurant: restaurant1, product_type: "Meal")
category4.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category4.save
  p category4.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/lemonade.jpg'))
category5 = Category.new(name: "Softdrink", restaurant: restaurant1, product_type: "Drink")
category5.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category5.save
  p category5.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/cocktails.jpg'))
category6 = Category.new(name: "Cocktail", restaurant: restaurant1, product_type: "Drink")
category6.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category6.save
  p category6.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/wines.jpg'))
category7 = Category.new(name: "Wine", restaurant: restaurant1, product_type: "Drink")
category7.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category7.save
  p category7.errors.messages
end

file = File.open(File.join(__dir__, 'images_seed/beers.jpg'))
category8 = Category.new(name: "Beer", restaurant: restaurant1, product_type: "Drink")
category8.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
unless category8.save
  p category8.errors.messages
end

file = File.open(File.join(__dir__, './images_seed/pizzamargarita.jpg'))
#file = file.read

#1
product1 = Product.new(
  name: 'Pizza Margherita',
  price: 12,
  description: "Pizza with mozzarella and basil",
  category: category1,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product1.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product1.save
    p product1.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/pepperonipizza.jpg'))
#file = file.read

#2
product2 = Product.new(
  name: 'Pizza Pepperoni',
  price: 13,
  description: "Pizza with mozzarella and pepperoni",
  category: category1,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product2.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product2.save
    p product2.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/quattroformaggi.jpg'))
#file = file.read

#3
product3 = Product.new(
  name: 'Pizza Quatro Formaggi',
  price: 14,
  description: "Pizza with four types of cheese",
  category: category1,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product3.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product3.save
    p product3.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/pizzaprosciutto.jpg'))
#file = file.read

#4
product4 = Product.new(
  name: 'Pizza Prosciutto e Funghi',
  price: 13,
  description: "Pizza with mozzarella, ham and mushrooms",
  category: category1,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product4.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product4.save
    p product4.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/mahou4.jpg'))
#file = file.read

#5
product5 = Product.new(
  name: 'Mahou',
  price: 3,
  description: "Spanish beer",
  category: category8,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product5.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product5.save
    p product5.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/heineken.jpg'))
#file = file.read

#6
product6 = Product.new(
  name: 'Heineken',
  price: 2,
  description: "German beer",
  category: category8,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product6.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product6.save
    p product6.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/desperados.jpg'))
#file = file.read

#7
product7 = Product.new(
  name: 'Desperados',
  price: 4,
  description: "Beer with tequila",
  category: category8,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product7.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product7.save
    p product7.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/budweiser.jpg'))
#file = file.read

#8
product8 = Product.new(
  name: 'Budweiser',
  price: 2,
  description: "American beer",
  category: category8,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product8.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product8.save
    p product8.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/carbonara.jpg'))
#file = file.read

#9
product9 = Product.new(
  name: 'Spaguetti carbonara',
  price: 15,
  description: "Spaguetti with bacon, egg and cheese",
  category: category2,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product9.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product9.save
    p product9.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/bolognese.jpg'))
#file = file.read

#10
product10 = Product.new(
  name: 'Tagliatelle bolognese',
  price: 14,
  description: "Tagliatelle with beef, tomato and parmesan cheese",
  category: category2,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product10.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product10.save
    p product10.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/pesto.jpg'))
#file = file.read

#11
product11 = Product.new(
  name: 'Fusilli al pesto',
  price: 15,
  description: "Macaroni with pesto sauce and parmesan cheese",
  category: category2,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product11.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product11.save
    p product11.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/gnocchi.jpg'))
#file = file.read

#12
product12 = Product.new(
  name: 'Gnocchi alla sorrentina',
  price: 16,
  description: "Gnocchi with tomato sauce, mozzarella and basil",
  category: category2,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product12.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product12.save
    p product12.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/glassrioja.jpg'))
    #file = file.read

#13
product13 = Product.new(
  name: 'Red wine',
  price: 5,
  description: "Glass of Ramon Bilbao",
  category: category7,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product13.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product13.save
    p product13.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/whitewine.jpg'))
#file = file.read

#14
product14 = Product.new(
  name: 'White wine',
  price: 6,
  description: "Glass of Jose Pariente",
  category: category7,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product14.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product14.save
    p product14.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/rosewinex.jpg'))
#file = file.read

#15
product15 = Product.new(
  name: 'Rose wine',
  price: 8,
  description: "Glass of Marques de Murrieta",
  category: category7,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product15.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product15.save
    p product15.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/champagne.jpg'))
#file = file.read

#16
product16 = Product.new(
  name: 'Champagne',
  price: 9,
  description: "Glass of Moet & Chandon ",
  category: category7,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product16.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product16.save
    p product16.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/tortillapatata.jpg'))
      #file = file.read

#17
product17 = Product.new(
  name: 'Tortilla de patata',
  price: 16,
  description: "The best tortilla in Madrid",
  category: category3,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product17.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product17.save
    p product17.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/croquetas.jpg'))
#file = file.read

#18
product18 = Product.new(
  name: 'Croquetas',
  price: 12,
  description: '8 ham croquetas',
  category: category3,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product18.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product18.save
    p product18.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/patatasbravas.jpg'))
#file = file.read

#19
product19 = Product.new(
  name: 'Patatas bravas',
  price: 8,
  description: 'Potatoes with sauce',
  category: category3,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product19.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product19.save
    p product19.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/calamares.jpg'))
#file = file.read

#20
product20 = Product.new(
  name: 'Calamares',
  price: 18,
  description: 'Fried calamari',
  category: category3,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product20.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product20.save
    p product20.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/burgerpic.jpg'))
#file = file.read

#21
product21 = Product.new(
  name: 'Cheeseburger',
  price: 14,
  description: "Burger with cheese and bacon",
  category: category4,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product21.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product21.save
    p product21.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/doublecheeseburger.jpg'))
#file = file.read

#22
product22 = Product.new(
  name: 'Double Bacon Cheeseburger',
  price: 14,
  description: "Double burger with cheese and bacon",
  category: category4,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product22.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product22.save
    p product22.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/eggburger.jpg'))
#file = file.read

#23
product23 = Product.new(
  name: 'Eggburger',
  price: 14,
  description: "Burger with egg and avocado",
  category: category4,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product23.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product23.save
    p product23.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/veggieburger.jpg'))
#file = file.read

#24
product24 = Product.new(
  name: 'Veggie Burger',
  price: 14,
  description: "Burger with fake meat, cheese, lettuce and tomato",
  category: category4,
  product_type: 'Meal',
  restaurant: restaurant1
)
  product24.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product24.save
    p product24.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/cocacola.jpg'))
#file = file.read

#25
product25 = Product.new(
  name: 'Coca-cola',
  price: 2,
  description: "Cocacola",
  category: category5,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product25.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product25.save
  p product25.errors.messages
end

file = File.open(File.join(__dir__, './images_seed/sprite.jpg'))
#file = file.read

#26
product26 = Product.new(
  name: 'Sprite',
  price: 2,
  description: 'Sprite',
  category: category5,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product26.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product26.save
    p product26.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/fanta.jpg'))
#file = file.read

#27
product27 = Product.new(
  name: 'Fanta',
  price: 2,
  description: 'Lemon fanta',
  category: category5,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product27.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product27.save
    p product27.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/aquarius.jpg'))
#file = file.read

#28
product28 = Product.new(
  name: 'Aquarius',
  price: 2,
  description: 'Orange aquarius',
  category: category5,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product28.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product28.save
    p product28.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/mojito.jpg'))
#file = file.read

#29
product29 = Product.new(
  name: 'Mojito',
  price: 11,
  description: "Rum, lime juice, cane sugar and mint",
  category: category6,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product29.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product29.save
    p product29.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/negroni.jpg'))
#file = file.read

#30
product30 = Product.new(
  name: 'Negroni',
  price: 12,
  description: "Gin, campari and vermouth",
  category: category6,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product30.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product30.save
    p product30.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/daiquiri.jpg'))
#file = file.read

#31
product31 = Product.new(
  name: 'Daiquiri',
  price: 12,
  description: "White rum, lime juice and syrup",
  category: category6,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product31.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product31.save
    p product31.errors.messages
  end

file = File.open(File.join(__dir__, './images_seed/aperolspritz.jpg'))
#file = file.read

#32
product32 = Product.new(
  name: 'Aperol Spritz',
  price: 10,
  description: "Prosecco, Aperol and soda",
  category: category6,
  product_type: 'Drink',
  restaurant: restaurant1
)
  product32.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
  unless product32.save
    p product32.errors.messages
  end
# {
#   name: 'Mahou',
#   price: '4',
#   description: "The best spanish beer",
#   category: 'Beer',
#   product_type: 'Drink',
#   restaurant: restaurant'1',
#   photo: {  File.open('downloads/mahou.jpg')
#     product.photo.attach(io: file, filename: "mahou.jpg", content_type: "image/jpg") product.save}
# },
# {
#   name: 'Cheeseburguer',
#   price: '15',
#   description: "With cheese, lettuce and tomato",
#   category: 'Burguer',
#   product_type: 'Meal',
#   restaurant: restaurant'1',
#   photo: {  File.open('downloads/burgerpic.jpg'),
#     product.photo.attach(io: image, filename: "burgerpic.jpg", content_type: "image/jpg")}
# },
# ])
ProductAllergy.create(
  product: product1,
  allergy: allergy2
)

ProductAllergy.create(
  product: product1,
  allergy: allergy9
)

ProductAllergy.create(
  product: product2,
  allergy: allergy1
)

ProductAllergy.create(
  product: product2,
  allergy: allergy9
)

ProductAllergy.create(
  product: product3,
  allergy: allergy1
)

ProductAllergy.create(
  product: product3,
  allergy: allergy9
)

ProductAllergy.create(
  product: product4,
  allergy: allergy1
)

ProductAllergy.create(
  product: product4,
  allergy: allergy9
)

ProductAllergy.create(
  product: product5,
  allergy: allergy2
)

ProductAllergy.create(
  product: product5,
  allergy: allergy14
)

ProductAllergy.create(
  product: product6,
  allergy: allergy2
)

ProductAllergy.create(
  product: product6,
  allergy: allergy14
)

ProductAllergy.create(
  product: product7,
  allergy: allergy2
)

ProductAllergy.create(
  product: product7,
  allergy: allergy14
)

ProductAllergy.create(
  product: product8,
  allergy: allergy2
)

ProductAllergy.create(
  product: product8,
  allergy: allergy14
)

ProductAllergy.create(
  product: product9,
  allergy: allergy2
)

ProductAllergy.create(
  product: product9,
  allergy: allergy4
)

ProductAllergy.create(
  product: product9,
  allergy: allergy9
)

ProductAllergy.create(
  product: product10,
  allergy: allergy2
)

ProductAllergy.create(
  product: product10,
  allergy: allergy4
)

ProductAllergy.create(
  product: product10,
  allergy: allergy9
)

ProductAllergy.create(
  product: product11,
  allergy: allergy2
)

ProductAllergy.create(
  product: product11,
  allergy: allergy4
)

ProductAllergy.create(
  product: product11,
  allergy: allergy9
)

ProductAllergy.create(
  product: product12,
  allergy: allergy2
)

ProductAllergy.create(
  product: product12,
  allergy: allergy4
)

ProductAllergy.create(
  product: product12,
  allergy: allergy9
)

ProductAllergy.create(
  product: product13,
  allergy: allergy14
)

ProductAllergy.create(
  product: product14,
  allergy: allergy14
)

ProductAllergy.create(
  product: product15,
  allergy: allergy14
)

ProductAllergy.create(
  product: product16,
  allergy: allergy14
)

ProductAllergy.create(
  product: product17,
  allergy: allergy4
)

ProductAllergy.create(
  product: product18,
  allergy: allergy2
)

ProductAllergy.create(
  product: product18,
  allergy: allergy9
)

ProductAllergy.create(
  product: product19,
  allergy: allergy2
)

ProductAllergy.create(
  product: product20,
  allergy: allergy2
)

ProductAllergy.create(
  product: product20,
  allergy: allergy3
)

ProductAllergy.create(
  product: product20,
  allergy: allergy4
)

ProductAllergy.create(
  product: product20,
  allergy: allergy5
)

ProductAllergy.create(
  product: product21,
  allergy: allergy2
)

ProductAllergy.create(
  product: product21,
  allergy: allergy8
)

ProductAllergy.create(
  product: product21,
  allergy: allergy11
)

ProductAllergy.create(
  product: product21,
  allergy: allergy14
)

ProductAllergy.create(
  product: product22,
  allergy: allergy2
)

ProductAllergy.create(
  product: product22,
  allergy: allergy8
)

ProductAllergy.create(
  product: product22,
  allergy: allergy11
)

ProductAllergy.create(
  product: product22,
  allergy: allergy14
)

ProductAllergy.create(
  product: product23,
  allergy: allergy2
)

ProductAllergy.create(
  product: product23,
  allergy: allergy8
)

ProductAllergy.create(
  product: product23,
  allergy: allergy11
)

ProductAllergy.create(
  product: product23,
  allergy: allergy14
)

ProductAllergy.create(
  product: product24,
  allergy: allergy2
)

ProductAllergy.create(
  product: product24,
  allergy: allergy7
)

ProductAllergy.create(
  product: product24,
  allergy: allergy8
)

ProductAllergy.create(
  product: product24,
  allergy: allergy14
)

ProductAllergy.create(
  product: product29,
  allergy: allergy14
)

ProductAllergy.create(
  product: product30,
  allergy: allergy14
)

ProductAllergy.create(
  product: product31,
  allergy: allergy14
)

ProductAllergy.create(
  product: product32,
  allergy: allergy14
)
