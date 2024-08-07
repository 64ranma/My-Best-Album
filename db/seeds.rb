# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "データの作成を開始します"

taro = User.find_or_create_by!(email: "taro@example.com") do |user|
  user.name = "taro"
  user.password = "taro0401"
end

taro.posts.find_or_create_by!(album_name: "aiueo", singer_name: "kakikukeko") do |post|
  post.body = "アルバムですよ"
end

Admin.create!(
  email: "admin@example.com",
  password: "admin0401"
)

puts "データの作成が完了しました"

