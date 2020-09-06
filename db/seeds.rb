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
owner_6 = Owner.create!(
	email: "iii@i",
	password: "111111",
	name: "飯田郁美",
	is_actived: false
)

shop_1 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "バナナカフェ",
	shop_detail: "パフェの美味しいカフェです。",
	address: "東京都新宿区西新宿１丁目１７",
	seat: 30,
	open_time_hour: "10",
	open_time_minute: "00",
	close_time_hour: "22",
	close_time_minute: "30",
	phone_number: "0300000000",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/milivoj-kuhar-Te48TPzdcU8-unsplash.jpg"),
	remarks: "第二水曜日も定休日です。"
)
ShopTag.create!(shop_id: shop_1.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_1.id, tag_id: tag_2.id)
Holiday.create!(shop_id: shop_1.id, holiday_number: 0)
Station.create!(shop_id: shop_1.id, prefecture: "01000" , line: "01100" , station_name: "新宿駅" )
Station.create!(shop_id: shop_1.id, prefecture: "01000" , line: "01100" , station_name: "代々木駅" )
Station.create!(shop_id: shop_1.id, prefecture: "01000" , line: "01100" , station_name: "大久保駅" )

shop_2 = Shop.create!(
	owner_id: owner_6.id,
	shop_name: "イチゴカフェ",
	shop_detail: "イチゴパフェの美味しいカフェです。",
	address: "東京都渋谷区神宮前１丁目１９",
	seat: 30,
	open_time_hour: 10,
	open_time_minute: 0,
	close_time_hour: 22,
	close_time_minute: 30,
	phone_number: "0300000001",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/clifford-VobvKmG-StA-unsplash.jpg"),
	remarks: "第二水曜日も定休日です。"
)
ShopTag.create!(shop_id: shop_2.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_2.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_2.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_2.id, holiday_number: 0)
Station.create!(shop_id: shop_2.id, prefecture: "01000" , line: "01200" , station_name: "原宿駅" )
Station.create!(shop_id: shop_2.id, prefecture: "01000" , line: "01200" , station_name: "渋谷駅" )
Station.create!(shop_id: shop_2.id, prefecture: "01000" , line: "01400" , station_name: "表参道駅" )

shop_3 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "南国カフェ",
	shop_detail: "いろいろなパフェがあります。
	メニューが豊富でコーヒーだけで４０種類以上あるのでコーヒー好きの人は楽しめます。",
	address: "東京都新宿区市谷田町１丁目２",
	seat: 30,
	open_time_hour: 9,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000002",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/cyril-saulnier-mpSMThAU4OY-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_3.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_3.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_3.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_3.id, holiday_number: 6)
Station.create!(shop_id: shop_3.id, prefecture: "01000" , line: "01100" , station_name: "市ヶ谷駅" )
Station.create!(shop_id: shop_3.id, prefecture: "01000" , line: "01100" , station_name: "飯田橋駅" )
Station.create!(shop_id: shop_3.id, prefecture: "01000" , line: "01100" , station_name: "四ツ谷駅" )

shop_4 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "ココアカフェ",
	shop_detail: "ココアの美味しいカフェです。",
	address: "東京都千代田区丸ノ内１丁目９",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000003",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/zahir-namane-0qF1JTmDLBY-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_4.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_4.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_4.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_4.id, holiday_number: 6)
Station.create!(shop_id: shop_4.id, prefecture: "01000" , line: "01200" , station_name: "東京駅" )
Station.create!(shop_id: shop_4.id, prefecture: "01000" , line: "01400" , station_name: "神田駅" )
Station.create!(shop_id: shop_4.id, prefecture: "01000" , line: "01400" , station_name: "銀座駅" )

shop_5 = Shop.create!(
	owner_id: owner_2.id,
	shop_name: "コーヒー天国",
	shop_detail: "コーヒーはおかわり自由です",
	address: "埼玉県さいたま市大宮区桜木町１丁目５",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 30,
	close_time_hour: 23,
	close_time_minute: 0,
	phone_number: "0300000004",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/kaylah-matthews-6e5hgWV2DAo-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_5.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_5.id, tag_id: tag_3.id)
ShopTag.create!(shop_id: shop_5.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_5.id, holiday_number: 6)
Station.create!(shop_id: shop_5.id, prefecture: "02000" , line: "02100" , station_name: "大宮駅" )
Station.create!(shop_id: shop_5.id, prefecture: "" , line: "" , station_name: "" )
Station.create!(shop_id: shop_5.id, prefecture: "" , line: "" , station_name: "" )

shop_6 = Shop.create!(
	owner_id: owner_3.id,
	shop_name: "コーヒーの楽園",
	shop_detail: "コーヒーはおかわり自由です",
	address: "埼玉県朝霞市三原１丁目１",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000005",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/michal-parzuchowski-ItaV89TNkks-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_5.id)
ShopTag.create!(shop_id: shop_6.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_6.id, holiday_number: 6)
Station.create!(shop_id: shop_6.id, prefecture: "02000" , line: "02200" , station_name: "朝霞駅" )
Station.create!(shop_id: shop_6.id, prefecture: "02000" , line: "02200" , station_name: "朝霞台駅" )
Station.create!(shop_id: shop_6.id, prefecture: "02000" , line: "02200" , station_name: "和光市駅" )

shop_7 = Shop.create!(
	owner_id: owner_4.id,
	shop_name: "コーヒーの花園",
	shop_detail: "コーヒー一杯100円です。",
	address: "東京都杉並区阿佐ケ谷北２丁目１３",
	seat: 20,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000006",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/nathan-dumlao-nBJHO6wmRWw-unsplash (1).jpg"),
	remarks: "日曜日のみ深夜０時まで営業しています。"
)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_6.id)
ShopTag.create!(shop_id: shop_7.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_7.id, holiday_number: 5)
Station.create!(shop_id: shop_7.id, prefecture: "01000" , line: "01100" , station_name: "高円寺駅" )
Station.create!(shop_id: shop_7.id, prefecture: "01000" , line: "01100" , station_name: "阿佐ケ谷駅" )
Station.create!(shop_id: shop_7.id, prefecture: "01000" , line: "01100" , station_name: "荻窪駅" )

shop_8 = Shop.create!(
	owner_id: owner_4.id,
	shop_name: "コーヒーパラダイス",
	shop_detail: "おすすめメニューはカフェラテです。",
	address: "東京都武蔵野市吉祥寺本町１丁目９",
	seat: 20,
	open_time_hour: 9,
	open_time_minute: 0,
	close_time_hour: 19,
	close_time_minute: 30,
	phone_number: "0300000007",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/nathan-dumlao-tA90pRfL2gM-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_8.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_8.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_8.id, holiday_number: 6)
Station.create!(shop_id: shop_8.id, prefecture: "01000" , line: "01100" , station_name: "西荻窪駅" )
Station.create!(shop_id: shop_8.id, prefecture: "01000" , line: "01100" , station_name: "吉祥寺駅" )
Station.create!(shop_id: shop_8.id, prefecture: "01000" , line: "01100" , station_name: "三鷹駅" )

shop_9 = Shop.create!(
	owner_id: owner_4.id,
	shop_name: "喫茶R",
	shop_detail: "ナポリタンが美味しいです。",
	address: "東京都渋谷区代々木２丁目６",
	seat: 20,
	open_time_hour: 9,
	open_time_minute: 0,
	close_time_hour: 20,
	close_time_minute: 30,
	phone_number: "0300000008",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/spencer-davis-LXKBzkKN9ZA-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_9.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_9.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_9.id, holiday_number: 0)
Station.create!(shop_id: shop_9.id, prefecture: "01000" , line: "01900" , station_name: "新宿駅" )
Station.create!(shop_id: shop_9.id, prefecture: "01000" , line: "01900" , station_name: "南新宿駅" )
Station.create!(shop_id: shop_9.id, prefecture: "01000" , line: "01900" , station_name: "大久保駅" )

shop_10 = Shop.create!(
	owner_id: owner_5.id,
	shop_name: "喫茶ブラック",
	shop_detail: "コーヒーが美味しいです。",
	address: "東京都世田谷区北沢２丁目１２",
	seat: 20,
	open_time_hour: 12,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000009",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/olga-popovych-QpG2YvaGytM-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_10.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_10.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_10.id, holiday_number: 0)
Station.create!(shop_id: shop_10.id, prefecture: "01000" , line: "01900" , station_name: "東北沢駅" )
Station.create!(shop_id: shop_10.id, prefecture: "01000" , line: "01900" , station_name: "下北沢駅" )
Station.create!(shop_id: shop_10.id, prefecture: "" , line: "" , station_name: "" )

shop_11 = Shop.create!(
	owner_id: owner_5.id,
	shop_name: "喫茶ホワイト",
	shop_detail: "ホワイトコーヒーが美味しいです。",
	address: "東京都目黒区大橋２丁目２２",
	seat: 20,
	open_time_hour: 12,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000010",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/samuel-cesar-IbTl5197EOo-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_11.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_11.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_11.id, holiday_number: 0)
Station.create!(shop_id: shop_11.id, prefecture: "01000" , line: "01800" , station_name: "渋谷駅" )
Station.create!(shop_id: shop_11.id, prefecture: "01000" , line: "01800" , station_name: "池尻大橋駅" )
Station.create!(shop_id: shop_11.id, prefecture: "01000" , line: "01800" , station_name: "三軒茶屋駅" )


shop_12 = Shop.create!(
	owner_id: owner_5.id,
	shop_name: "まったり喫茶",
	shop_detail: "静かなカフェです。",
	address: "神奈川県川崎市多摩区登戸３４３５",
	seat: 20,
	open_time_hour: 12,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000011",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/toa-heftiba-W6sqUYlJRiw-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_12.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_12.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_12.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_12.id, holiday_number: 0)
Station.create!(shop_id: shop_12.id, prefecture: "03000" , line: "03100" , station_name: "登戸駅" )
Station.create!(shop_id: shop_12.id, prefecture: "03000" , line: "03100" , station_name: "向ヶ丘遊園駅" )
Station.create!(shop_id: shop_12.id, prefecture: "" , line: "" , station_name: "" )

shop_13 = Shop.create!(
	owner_id: owner_3.id,
	shop_name: "Rの楽園",
	shop_detail: "コーヒーのおかわり自由です",
	address: "神奈川県川崎市多摩区西生田３丁目９",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000005",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/daniele-riggi-OTTfvhpbeTU-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_13.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_13.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_13.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_13.id, tag_id: tag_5.id)
ShopTag.create!(shop_id: shop_13.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_13.id, holiday_number: 6)
Station.create!(shop_id: shop_13.id, prefecture: "03000" , line: "03100" , station_name: "読売ランド前駅" )
Station.create!(shop_id: shop_13.id, prefecture: "03000" , line: "03100" , station_name: "新百合ヶ丘駅" )
Station.create!(shop_id: shop_13.id, prefecture: "" , line: "" , station_name: "" )

shop_14 = Shop.create!(
	owner_id: owner_3.id,
	shop_name: "カフェT",
	shop_detail: "落ちついた雰囲気のカフェです。",
	address: "神奈川県横浜市西区みなとみらい２丁目２",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000005",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/igor-starkov-8PW9y8XQTFg-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_14.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_14.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_14.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_14.id, tag_id: tag_5.id)
ShopTag.create!(shop_id: shop_14.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_14.id, holiday_number: 6)
Station.create!(shop_id: shop_14.id, prefecture: "03000" , line: "03200" , station_name: "横浜駅" )
Station.create!(shop_id: shop_14.id, prefecture: "03000" , line: "03200" , station_name: "桜木町駅" )
Station.create!(shop_id: shop_14.id, prefecture: "" , line: "" , station_name: "" )

shop_15 = Shop.create!(
	owner_id: owner_3.id,
	shop_name: "喫茶ドール",
	shop_detail: "ココアがとても美味しいです。",
	address: "千葉県千葉市中央区春日２丁目１０",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000005",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/lukas-fitria-adi-setiawan-5mWym7qiFdw-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_15.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_15.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_15.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_15.id, tag_id: tag_5.id)
ShopTag.create!(shop_id: shop_15.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_15.id, holiday_number: 6)
Station.create!(shop_id: shop_15.id, prefecture: "04000" , line: "04100" , station_name: "千葉駅" )
Station.create!(shop_id: shop_15.id, prefecture: "04000" , line: "04100" , station_name: "西千葉駅" )
Station.create!(shop_id: shop_15.id, prefecture: "" , line: "" , station_name: "" )

shop_16 = Shop.create!(
	owner_id: owner_3.id,
	shop_name: "N",
	shop_detail: "落ちついた雰囲気のカフェです。",
	address: "千葉県船橋市本町１丁目",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000005",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/quaid-lagan-jA9a1yepfEk-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_16.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_16.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_16.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_16.id, tag_id: tag_5.id)
ShopTag.create!(shop_id: shop_16.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_16.id, holiday_number: 6)
Station.create!(shop_id: shop_16.id, prefecture: "04000" , line: "04100" , station_name: "船橋駅" )
Station.create!(shop_id: shop_16.id, prefecture: "04000" , line: "04100" , station_name: "西船橋駅" )
Station.create!(shop_id: shop_16.id, prefecture: "" , line: "" , station_name: "" )

shop_17 = Shop.create!(
	owner_id: owner_2.id,
	shop_name: "カプチーノ天国",
	shop_detail: "カプチーノが美味しいです。",
	address: "千葉県松戸市松戸１２３０",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000004",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/kaylah-matthews-6e5hgWV2DAo-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_17.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_17.id, tag_id: tag_3.id)
ShopTag.create!(shop_id: shop_17.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_17.id, holiday_number: 6)
Station.create!(shop_id: shop_17.id, prefecture: "04000" , line: "04200" , station_name: "松戸駅" )
Station.create!(shop_id: shop_17.id, prefecture: "04000" , line: "04200" , station_name: "北松戸駅" )
Station.create!(shop_id: shop_17.id, prefecture: "" , line: "" , station_name: "" )

shop_18 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "マロンカフェ",
	shop_detail: "栗のパフェがあります。",
	address: "群馬県高崎市八島町２２",
	seat: 30,
	open_time_hour: 9,
	open_time_minute: 45,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000002",
	is_favorite: true,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/cyril-saulnier-mpSMThAU4OY-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_18.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_18.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_18.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_18.id, holiday_number: 6)
Station.create!(shop_id: shop_18.id, prefecture: "05000" , line: "05100" , station_name: "高崎駅" )
Station.create!(shop_id: shop_18.id, prefecture: "05000" , line: "05100" , station_name: "倉賀野駅" )
Station.create!(shop_id: shop_18.id, prefecture: "" , line: "" , station_name: "" )

shop_19 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "ハンバーガーカフェ",
	shop_detail: "ハンバーガーが美味しいです。",
	address: "栃木県小山市城山町３丁目３",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000003",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/drew-coffman-jUOaONoXJQk-unsplash (3).jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_19.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_19.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_19.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_19.id, holiday_number: 6)
Station.create!(shop_id: shop_19.id, prefecture: "06000" , line: "06100" , station_name: "小山駅" )
Station.create!(shop_id: shop_19.id, prefecture: "06000" , line: "06100" , station_name: "小金井駅" )
Station.create!(shop_id: shop_19.id, prefecture: "" , line: "" , station_name: "" )

shop_20 = Shop.create!(
	owner_id: owner_1.id,
	shop_name: "SDカフェ",
	shop_detail: "メニューが豊富です。",
	address: "栃木県塩谷郡高根沢町大字宝積寺",
	seat: 30,
	open_time_hour: 10,
	open_time_minute: 30,
	close_time_hour: 22,
	close_time_minute: 30,
	phone_number: "0300000000",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/tony-lee-8IKf54pc3qk-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_20.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_20.id, tag_id: tag_2.id)
Holiday.create!(shop_id: shop_20.id, holiday_number: 0)
Station.create!(shop_id: shop_20.id, prefecture: "06000" , line: "06100" , station_name: "宝積寺駅" )
Station.create!(shop_id: shop_20.id, prefecture: "06000" , line: "06100" , station_name: "氏家駅" )
Station.create!(shop_id: shop_20.id, prefecture: "" , line: "" , station_name: "" )

shop_21 = Shop.create!(
	owner_id: owner_3.id,
	shop_name: "モンブランの楽園",
	shop_detail: "モンブランが美味しいです。",
	address: "茨城県日立市鹿島町３丁目４",
	seat: 30,
	open_time_hour: 11,
	open_time_minute: 0,
	close_time_hour: 23,
	close_time_minute: 30,
	phone_number: "0300000005",
	is_favorite: false,
	is_active: true,
	shop_image: open("#{Rails.root}/db/seeds/images/the-creative-exchange-d1ngW7SNehM-unsplash.jpg"),
	remarks: ""
)
ShopTag.create!(shop_id: shop_21.id, tag_id: tag_1.id)
ShopTag.create!(shop_id: shop_21.id, tag_id: tag_2.id)
ShopTag.create!(shop_id: shop_21.id, tag_id: tag_4.id)
ShopTag.create!(shop_id: shop_21.id, tag_id: tag_5.id)
ShopTag.create!(shop_id: shop_21.id, tag_id: tag_7.id)
Holiday.create!(shop_id: shop_21.id, holiday_number: 6)
Station.create!(shop_id: shop_21.id, prefecture: "07000" , line: "07100" , station_name: "勝田駅" )
Station.create!(shop_id: shop_21.id, prefecture: "07000" , line: "07100" , station_name: "日立駅" )
Station.create!(shop_id: shop_21.id, prefecture: "" , line: "" , station_name: "" )



