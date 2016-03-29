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
t1 = Tag.create(title: "Beaches", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg")
t2 = Tag.create(title: "opowiadanko", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/closer.jpg")
t3 = Tag.create(title: "Trzecie", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg")

p1 = Post.create(title: "Ipanema", content: "The beach of Ipanema is known for its elegant development and its social life.", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach02.jpg", description: "lalala")
p2 = Post.create(title: "7 Mile Beach", content: "The western coastline contains the island's finest beaches.", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach03.jpg", description: " lilili", )
p3 = Post.create(title: "El Castillo", content: "An elite destination famous for its white sand beaches", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach04.jpg", description: "Lololo")
p4 = Post.create(title: "Nowy post", content: "An elite destination famous for its white sand beaches", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach04.jpg", description: "Lololo")

t1.posts << [p1, p2]
t2.posts << [p3]