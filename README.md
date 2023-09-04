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



# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_kanji         | string | null: false               |
| name_kana          | string | null: false               |
| birth              | text   | null: false               |
| favorite           | text   | null: false               |

### Association

- has_many :comments
- has_many :items
- has_one :purchases



## items テーブル

| Column       | Type   | Options                   |
| ------------ | ------ | ------------------------- |
| name         | string | null: false               |
| description  | text   | null: false               |
| category     | string | null: false               |
| status       | string | null: false               |

### Association

- belongs_to :users
- has_many :comments



## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items



## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| shipment_id   | references | null: false, foreign_key: true |

### Association

- has_one :shipments
- belongs_to :users



## shipments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| purchase_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
