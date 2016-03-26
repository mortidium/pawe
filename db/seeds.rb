# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
marta = User.create(first_name: 'Marta', last_name: 'Mościcka', email: 'martamoscicka1@gmail.com', password: 'eldarion14', password_confirmation: 'eldarion14', role: 'editor')
julian = User.create(first_name: 'Julian', last_name: 'Jones', email: 'julian@email.com', password: 'Julian1', password_confirmation: 'Julian1')
pawel = User.create(first_name: 'Paweł', last_name: 'Maniciak', email: 'paweljanm@gmail.com', password: '91RnJo59', password_confirmation: '91RnJo59', role: 'editor')
