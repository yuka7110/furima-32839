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

##　users テーブル

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
- has_many :buys

## items テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false,                   |
| condition_id    | integer    | null: false,                   |
| fee_id          | integer    | null: false,                   |
| prefecture_id   | integer    | null: false,                   |
| day_id          | integer    | null: false,                   |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one    :buy


## buys　テーブル

| Column        | Type         | Option                         |
| ------------- | ------------ | ------------------------------ |
| user          | references   | null: false, foreign_key: true |
| item          | references   | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_many   :items
- has_one    :prefecture


## prefectures テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_num        | string     | null: false                    |
| prefecture_id   | integer    | null: false,                   | 
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_num       | string     | null: false                    |
| buy             | references | null: false, foreign_key: true |

## Association
- belongs_to :buy