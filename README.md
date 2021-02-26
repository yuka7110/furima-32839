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

##　user テーブル

| Column        | Type     | Options       |
| ------------- | -------- | ------------- |
| name          | string   | null: false   |
| email         | string   | null: false   |
| password      | string   | null: false   |

## Association
- has_many :items
- belongs_to :buyer


## buyer テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| first_name      | string    | null: false                    |
| last_name       | string    | null: false                    |
| first_name_kana | string    | null: false                    |
| last_name_kana  | string    | null: false                    |
| post_num        | string    | null: false                    |
| prefecture      | string    | null: false                    | 
| municipality    | string    | null: false                    |
| address         | string    | null: false                    |
| phone_num       | string    | null: false                    |
| user_id         | string    | null: false, foreign_key: true |

## Association
-belongs_to :user


## item テーブル

| Column          | Type      | Option                         |
| --------------- | --------- | ------------------------------ |
| name            | string    | null: false                    |
| image           | string    | null: false                    |
| description     | string    | null: false                    |
| category        | string    | null: false                    |
| condition       | string    | null: false                    |
| fee             | string    | null: false                    |
| prefecture      | string    | null: false                    |
| days            | string    | null: false                    |
| price           | string    | null: false                    |
| user_id         | integer   | null: false, foreign_key: true |

## Association
-belongs_to :user
