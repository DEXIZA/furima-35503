## usersテーブル

| Column                | Type       | Options                  |
| --------------------- | ---------- | -------------------------|
| nickname              | string     | null: false              |
| email                 | string     | null: false,unique: true |
| encrypted_password    | string     | null: false              |
| last_name             | string     | null: false              |
| first_name            | string     | null: false              |
| last_name_kana        | string     | null: false              |
| first_name_kana       | string     | null: false              |
| birthday              | date       | null: false              |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- |--------------------------------|
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefectures_id      | integer    | null: false                    |
| shipping_time_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| user         | references | null: false, foreign_key: true |
| Item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to : item
- has_one :shipping_add_info

## shipping_add_infos テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- |--------------------------------|
| postal_code           | string     | null: false                    |
| prefectures_id        | integer    | null: false                    |
| municipality          | string     | null: false                    |
| street_address        | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | integer    | null: false                    |
| purchase_record       | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase_record