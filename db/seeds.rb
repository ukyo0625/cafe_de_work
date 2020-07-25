# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@example.jp",
              password: "12345678"
              )

Tag.create!(
name:"wifi利用可"
)

Tag.create!(
name:"コンセント使用可"
)
Tag.create!(
name:"分煙"
)
Tag.create!(
name:"喫煙席有"
)
Tag.create!(
name:"駐車場有"
)
Tag.create!(
name:"駅徒歩５分以内"
)
Tag.create!(
name:"クレジットカード利用可"
)