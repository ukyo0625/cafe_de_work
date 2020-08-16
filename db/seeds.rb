# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
	email: "admin@example.jp",
    password: "12345678"
)

tag_1 = Tag.create!(name:"wifi利用可")
tag_2 = Tag.create!(name:"コンセント使用可")
tag_3 = Tag.create!(name:"分煙")
tag_4 = Tag.create!(name:"喫煙席有")
tag_5 = Tag.create!(name:"駐車場有")
tag_6 = Tag.create!(name:"駅徒歩５分以内")
tag_7 = Tag.create!(name:"クレジットカード利用可")

owner_1 = Owner.create!(
	email: "aaa@a",
	password: "111111",
	name: "阿部あきら",
	is_actived: true
)
owner_2 = Owner.create!(
	email: "kkk@k",
	password: "111111",
	name: "川上こうた",
	is_actived: true
)
owner_3 = Owner.create!(
	email: "ooo@o",
	password: "111111",
	name: "大神おさむ",
	is_actived: true
)
owner_4 = Owner.create!(
	email: "ttt@t",
	password: "111111",
	name: "田中太朗",
	is_actived: true
)
owner_5 = Owner.create!(
	email: "sss@s",
	password: "111111",
	name: "庄島幸子",
	is_actived: true
)

shop_1 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "バナナカフェ",
	shop_detail: "パフェの美味しいカフェです。",
	address: "東京都新宿区",
	seat: 30,
	open_time: "10",
	close_time: "22",
	phone_number: "0300000000",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/milivoj-kuhar-Te48TPzdcU8-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_1.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_1.id, tag_id: tag_2.id)
Holiday.create!(shop_id: shop_1.id, holiday_number: 0)

shop_2 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "イチゴカフェ",
	shop_detail: "イチゴパフェの美味しいカフェです。",
	address: "東京都渋谷区",
	seat: 30,
	open_time: "10",
	close_time: "22",
	phone_number: "0300000001",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/clifford-VobvKmG-StA-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_2.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_2.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_2.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_2.id, holiday_number: 0)

shop_3 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "南国カフェ",
	shop_detail: "いろいろなパフェがあります。",
	address: "東京都武蔵野市",
	seat: 30,
	open_time: "9",
	close_time: "23",
	phone_number: "0300000002",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/cyril-saulnier-mpSMThAU4OY-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_3.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_3.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_3.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_3.id, holiday_number: 6)

shop_4 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "ココアカフェ",
	shop_detail: "ココアの美味しいカフェです。",
	address: "埼玉県大宮市",
	seat: 30,
	open_time: "11",
	close_time: "23",
	phone_number: "0300000003",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/drew-coffman-jUOaONoXJQk-unsplash (3).jpg")
)
ShopTag.create!(shop_id: shop_4.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_4.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_4.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_4.id, holiday_number: 6)

shop_5 = Shop.create!(
	owner_id: owner_2.id,
	shop_name: "コーヒー天国",
	shop_detail: "コーヒーはおかわり自由です",
	address: "埼玉県入間市",
	seat: 30,
	open_time: "11",
	close_time: "23",
	phone_number: "0300000004",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/kaylah-matthews-6e5hgWV2DAo-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_5.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_5.id, tag_id: tag_3.id)
ShopTag.create!(shop_id: shop_5.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_5.id, holiday_number: 6)

shop_6 = Shop.create!(
	owner_id: owner_3.id,
	shop_name: "コーヒーの楽園",
	shop_detail: "コーヒーはおかわり自由です",
	address: "千葉県千葉市",
	seat: 30,
	open_time: "11",
	close_time: "23",
	phone_number: "0300000005",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/michal-parzuchowski-ItaV89TNkks-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_5.id)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_6.id, holiday_number: 6)

shop_7 = Shop.create!(
	owner_id: owner_4.id,
	shop_name: "コーヒーの花園",
	shop_detail: "コーヒー一杯100円です。",
	address: "東京都中野区",
	seat: 20,
	open_time: "11",
	close_time: "23",
	phone_number: "0300000006",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/nathan-dumlao-nBJHO6wmRWw-unsplash (1).jpg")
)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_6.id)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_7.id, holiday_number: 5)

shop_8 = Shop.create!(
	owner_id: owner_4.id,
	shop_name: "コーヒーパラダイス",
	shop_detail: "おすすめメニューはカフェラテです。",
	address: "東京都中野区",
	seat: 20,
	open_time: "9",
	close_time: "19",
	phone_number: "0300000007",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/nathan-dumlao-tA90pRfL2gM-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_8.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_8.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_8.id, holiday_number: 6)

shop_9 = Shop.create!(
	owner_id: owner_4.id,
	shop_name: "喫茶R",
	shop_detail: "ナポリタンが美味しいです。",
	address: "東京都中野区",
	seat: 20,
	open_time: "9",
	close_time: "20",
	phone_number: "0300000008",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/nathan-dumlao-zUNs99PGDg0-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_9.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_9.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_9.id, holiday_number: 0)

shop_10 = Shop.create!(
	owner_id: owner_5.id,
	shop_name: "喫茶ブラック",
	shop_detail: "コーヒーが美味しいです。",
	address: "東京都杉並区",
	seat: 20,
	open_time: "12",
	close_time: "23",
	phone_number: "0300000009",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/olga-popovych-QpG2YvaGytM-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_10.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_10.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_10.id, holiday_number: 0)

shop_11 = Shop.create!(
	owner_id: owner_5.id,
	shop_name: "喫茶ホワイト",
	shop_detail: "ホワイトコーヒーが美味しいです。",
	address: "東京都杉並区",
	seat: 20,
	open_time: "12",
	close_time: "23",
	phone_number: "0300000010",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/samuel-cesar-IbTl5197EOo-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_11.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_11.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_11.id, holiday_number: 0)

shop_12 = Shop.create!(
	owner_id: owner_5.id,
	shop_name: "まったり喫茶",
	shop_detail: "静かなカフェです。",
	address: "東京都杉並区",
	seat: 20,
	open_time: "12",
	close_time: "23",
	phone_number: "0300000011",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/toa-heftiba-W6sqUYlJRiw-unsplash.jpg")
)
ShopTag.create!(shop_id: shop_12.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_12.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_12.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_12.id, holiday_number: 0)