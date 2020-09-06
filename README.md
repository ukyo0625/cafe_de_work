# README
サイト名：Cafe De Work http://cafedework.work/

サイト概要：仕事や勉強をしやすいカフェの検索サイト

#サイトテーマ
仕事・勉強をしやすい環境の情報提供。
会社外で仕事をすることも増えてくるご時世で
カフェなどでパソコンを開かなければいけない事も多いです。
カフェのオーナーがカフェの情報を提供し
カフェで仕事をしたい人が行きたいカフェの条件を入力し来店する。
カフェのオーナーと仕事をする人、双方に有用な投稿・検索サイトを作成しました。

#テーマを選んだ理由
私自身がカフェで勉強をする事が多く、居酒屋などの検索サイトのように
カフェの情報サイトもあればいい思いました。今後リモートワークが増えていく中で
コンセントがないとパソコンの充電もできず長時間カフェで仕事をする事ができず
また、wifiルーターを持ち歩いていない人にとってはwifiの有無によっても
仕事の捗り方が違います。仕事をする人にいい環境を与えられるように
細かい検索ができるように検索機能を重視したこのサイト・テーマを選びました。

#ターゲットユーザ
オーナー：カフェのオーナー
ユーザー：リモートワークで働く人・学生

#主な利用シーン
オーナー：カフェの経営をしている時
ユーザー：カフェで仕事をする際にwifiやコンセントを使用したい時
　　　　　勉強するためにカフェに行きたいがクレジットカードで支払いたい時

#環境/使用技術一覧
#使用言語/フレームワーク

#フロントエンド
Bootstrap 3
JavaScript
Ajax

#バックエンド
ruby 2.5.7
Rails 5.2.4.3

#開発環境
Vagrant 2.2.6
VirtualBox

##本番環境/デプロイ
#DB server
RDS(MySQL)
#Web server
Nginx
#AP server
Puma
#Route53


# 設計書
テーブル定義書
https://docs.google.com/spreadsheets/d/1xTPNZnf_cXJCmb4gEI0XSY_cM1c4hJ1714wuorlew2w/edit#gid=177983633
AWS構成図
https://drive.google.com/file/d/1T2pyUVNjYSdrtLlv6INyz0r-rHJdlTAH/view?usp=sharing
AWSインフラ設計書
https://docs.google.com/spreadsheets/d/1aIaSw3ot92_09hd_bW6mBjVu4t90nYoiFGo6ifzoqAM/edit#gid=0


# 機能一覧
https://docs.google.com/spreadsheets/d/13T9A7q0XNAp8GbukGSXjd1xb0HE5mgbsApr3USIzfsY/edit?usp=sharing

#管理者機能
オーナー検索（名前）
お気に入り機能（ユーザーのTOPページに表示できる）
カフェ検索

#オーナー機能
登録・退会・ログイン・ログアウト
カフェの投稿・編集

#ユーザー機能
カフェ検索

#検索機能
カフェの名前・詳細検索
来店日検索（定休日のカフェを検索対象から除外し表示）
タグ検索（行きたいカフェの条件を入力し満たしているカフェを表示）
最寄駅検索（カフェに登録されている最寄駅で検索）

#map機能
カフェの場所をGoogleMapAPIにて表示させる


