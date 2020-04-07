# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Create Post"

user = User.new(email: "juansolano1039@gmail.com",password: "123456" , name: "Juan Pablo Solano")
user.save!
post = Post.new(title: "Test",user_id: 1, category: "Volunteering",description: "This is a test", date: Time.now - 3 ,group: "Community Posting")
post.save!
