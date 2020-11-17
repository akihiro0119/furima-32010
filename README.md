
## Usersテーブル

| Column               | Type    | Options      |
|----------------------|------------------------|
| nickname             | string  | null: false  |
| email                | string  | null: false  |
| encrypted_password   | string  | null: false  |
| first_name           | string  | null: false  |
| last_name            | string  | null: false  |
| First_name           | string  | null: false  |
| Last_name            | string  | null: false  |
| birth_day            | date    | null: false  |


### Association

- has_many :item
- has_one : history

## Itemsテーブル

| Column         | Type          | Options                      |
|----------------|---------------|------------------------------|
| title          | staring       | null: false                  |
| explanation    | text          | null: false                  |
| category_id    | integer       | null: false                  |
| status_id      | integer       | null: false                  |
| freight_id     | integer       | null: false                  |
| area_id        | integer       | null: false                  |
| shipdate_id    | integer       | null: false                  |
| user           | references    | null: false foreign_key: true|

### Association

- belong_to :user
- has_one :history

## Addressテーブル

| Column       | Type     | Options                       |
|--------------|----------|-------------------------------|
| postal code  | staring  | null: false                   |
| pref         | staring  | null: false                   |
| city         | staring  | null: false                   |
| address_code | staring  | null: false                   |
| building     | staring  |                               |
| telephone    | staring  | null; false                   |
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










