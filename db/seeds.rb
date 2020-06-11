# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{username: "hoaitrinh459", password: "1", firstName: "La", lastName: "Trinh", email: "hoaitrinh459@gmail.com", dateOfBirth: "04/05/1999", isAdmin: true}])
Category.create(name: "Machine")
Word.create(word: "Motor", diction: "Mô tơ", mean: "Động cơ", category_id: Category.where(name: "Machine").first.id, image_link: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fgiamotordien.wordpress.com%2Fcategory%2Fbang-gia-mo-to-siemens%2F&psig=AOvVaw1qzMWtEr0OylRsTki39E9F&ust=1591946609551000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPD8q7ad-ekCFQAAAAAdAAAAABAD")
UserWordRelationship.create(user_id: "1", word_id: "1", type: 'Like')