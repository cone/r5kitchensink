# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dummy.create(name: "Dummy1")
Test.create(dummy: Dummy.last, name: "Test 1")
Brand.create(name: "Brand 1", description: "The first brand")
Product.create(brand: Brand.last, name: "Product 1", description: "The first product")