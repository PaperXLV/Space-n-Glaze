# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create! id: 1, name: "Glazed", price: 0.80, active: true, image: 'glazed-donut.png'
Product.create! id: 2, name: "Sprinkled", price: 0.80, active: true, image: 'sprinkle-donut.jpg'
Product.create! id: 3, name: "Heart", price: 0.99, active: true, image: 'heart-donut.jpg'
Product.create! id: 4, name: "Specialty", price: 1.19, active: true, image: 'specialty-donut.jpg'


OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"