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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name       |string|null: false|
|first_name        |string|null: false|
|family_name_kana  |string|null: false|
|first_name_kana   |string|null: false|
|nickname          |string|null: false, unique: true|
|email             |string|null: false, unique: true|
|password          |string|null: false|
|phone_number      |string|null: false, unique: true|
|birthday          |string|null: false|
|introduction      |string|null: true|

### Association
- has_many :addresses
- has_many :cards
- has_many :items
- has_many :sns_credentials


## adressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name      |string |null: false|
|first_name       |string |null: false|
|family_name_kana |string |null: false|
|first_name_kana  |string |null: false|
|post_code        |string |null: false|
|prefecture_id    |integer|null: false|
|city             |string |null: false|
|street_number    |string |null: false|
|building_name    |string |null: true|
|phone_number     |string |null: true|
|user_id          |integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id       |integer|null: false, foreign_key: true|
|customer_id   |integer|null: false|
|card_id       |integer|null: false|

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name                     |string |null: false, index: true|
|user_id                  |integer|null: false, foreign_key: true|
|size                     |string |
|item_status_id           |integer|null: false|
|shipping_fee_defrayer_id |integer|null: false|
|ship_from_prefecture     |integer|null: false|
|ship_date_id             |integer|null: false|
|price                    |integer|null: false|
|description              |string |null: false|
|buyer_id                 |integer|
|status                   |integer|null: false|

### Association
- belongs_to :user
- has_many :images


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false|
|provider|string |null: false|
|user_id |integer|null: false, foreign_key: true|

### Association
- belongs_to :user