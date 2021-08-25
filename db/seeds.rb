# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@lotex.test', password: 'password2021',) if Rails.env.development?

countries = %w[cz by de].freeze
companies = 10.times.map { Faker::Company.name }
industries = 10.times.map { Faker::Commerce.department }
products = 10.times.map { Faker::Commerce.material }
lot_sizes = ['200 000 kg', '250 000 m', '1 000 000 pc', '1 000 m3'].freeze
1000.times do
  Product.create!(
    company: companies.sample,
    product: products.sample,
    industry: industries.sample,
    name: Faker::Commerce.product_name,
    hs_code: 3901209000 + rand(1000),
    country_code: countries.sample,
    lot_size: lot_sizes.sample,
    price: Faker::Commerce.price
  )
end
