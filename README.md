## usersテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ------------|
| nickname         | string     | null: false |
| email            | string     | null: false |
| last_name        | string     | null: false |
| first_name       | string     | null: false |
| last_name_kana   | string     | null: false |
| first_name_kana  | string     | null: false |
| birthday_year    | integer    | null: false |
| birthday_month   | integer    | null: false |
| birthday_day     | integer    | null: false |



### Association
- has_many :items
- has_many :purchase_records

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- |--------------------------------|
| image           |            | null: false                    |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| shipping_charges| integer    | null: false                    |
| prefectures     | integer    | null: false                    |
| shipping_time   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |


### Association
- belongs_to :users
- belongs_to :purchase_records


## purchase_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| user_id      | references | null: false, foreign_key: true |
| Item_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :items

## shipping_add_infos テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- |--------------------------------|
| postal_code           | string     | null: false                    |
| prefectures           | integer    | null: false                    |
| municipality          | string     | null: false                    |
| street_address        | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | integer    | null: false                    |
| purchase_record_id    | references | null: false, foreign_key: true |


### Association
- has_one :purchase_records