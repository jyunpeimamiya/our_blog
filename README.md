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

* ...


Name
boolog

Overview
誰にも公開されない自分だけのブログ

## Description
snsで登録、いいね機能、投稿機能
## Demo

## VS. 

## Requirement

## Usage

## Install

## Contribution

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[tcnksm](https://github.com/tcnksm)


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|             #ニックネーム
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|

### Association
- has_many :items, dependent: :destroy
- has_one :address, dependent: :destroy