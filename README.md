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

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| name               | string   | null: false              |
| email              | string   | null: false, unique true |
| encrypted_password | string   | null: false              |
| first_name         | string   | null: false              |
| last_name          | string   | null: false              |
| first_name_kana    | string   | null: false              |
| last_name_kana     | string   | null: false              |
| birthday           | date     | null: false              |

## Association
- has_many :items
- has_many :prefectures


## prefecture テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_num        | string     | null: false                    |
| prefecture      | string     | null: false                    | 
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| phone_num       | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

## Association
-belongs_to :user


## item テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false, foreign_key: true |
| condition_id    | integer    | null: false, foreign_key: true |
| fee_id          | integer    | null: false, foreign_key: true |
| prefecture_id   | integer    | null: false, foreign_key: true |
| days_id         | integer    | null: false, foreign_key: true |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

## Association
-belongs_to :user
