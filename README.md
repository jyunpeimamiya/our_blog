# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* …

# Name
boolog
Snsで登録、いいね機能、投稿機能
誰にも公開されない自分だけのブログ

# Features
ブログのように投稿できるが公開されないので
自分だけの空間を作れる

# Production environment*/
Heroku
アカウント:user@user.com
pass:aaaaaa

# Intention*/
手帳のようなアプリを作成する途中でブログ感覚で投稿できたら楽しいなと思いこのようなアプリになりました

# DEMO*/
https://i.gyazo.com/2409a7c561e8129f268d3ba9feda3874.jpg

# 工夫したポイント*/
出来るだけシンプルな見た目を意識してユーザーが飽きないように
トップページに毎日変更されるニュース情報を取り入れました

# 課題や今後実装したい機能*/
投稿した詳細のビューが見にくいのでページ移動して見やすさを改善する。他の部分も同様に修正する



## usersテーブル*/
|Column|Type|Options|
|———|——|———|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|

### Association*/
- has_many :posts, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_posts, through: :likes, source: :post
- has_many :sns_credentials

## postsテーブル*/
|Column|Type|Options|
|———|——|———|
|title|string|null: false,presence: true|
|content|text|null: false,presence: true|
|user_id|string|null: false|

### Association*/
- belongs_to :users
- has_many :likes
- has_many :liked_users, through: :likes, source: :user

## likesテーブル*/
|Column|Type|Options|
|———|——|———|
|post_id|string|null: false,presence: true|
|user_id|string|null: false|

### Association*/
- belongs_to :post
- belongs_to :user