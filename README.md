
## Usersテーブル

| Column               | Type    | Options      |
|----------------------|------------------------|
| nickname             | string  | null: false  |
| email                | string  | null: false  |
| encrypted_password   | string  | null: false  |
| first_name           | string  | null: false  |（漢字）
| last_name            | string  | null: false |(漢字)
| firstname            | string  | null: false  |（カナ）
| lastname             | string  | null: false   |（カナ）
| birth_day            | date    | null: false  |


### Association

- has_many :item
- has_one : history

## Itemsテーブル

| Column         | Type          | Options                      |
|----------------|---------------|------------------------------|
| title          | string        | null: false                  |
| explanation    | text          | null: false                  |
| category_id    | integer       | null: false                  |
| status_id      | integer       | null: false                  |
| freight_id     | integer       | null: false                  |(送料)
| area_id        | integer       | null: false                  |(地域)
| shipdate_id    | integer       | null: false                  |(発送までの)
| user           | references    | null: false foreign_key: true|

### Association

- belong_to :user
- has_one :history

## Addressテーブル

| Column       | Type     | Options                       |
|--------------|----------|-------------------------------|
| postal code  | string   | null: false                   |
| pref_id      | integer  | null: false                   |(都道府県)
| city         | string   | null: false                   |(市町村区)
| address_code | string   | null: false                   |(住所)
| building     | string   |                               |
| telephone    | string   | null; false                   |
| history      | reference| null: false foreign_key: true |

### Association

- belong_to : history

## historyテーブル

| Column| Type      | Options                      |
|-------|-----------|------------------------------|
| user  | reference | null: false foreign_key: true|
| item  | reference | null: false foreign_key: true|

### Association

- belong_to : user
- belong_to : item
- belong_to :address










