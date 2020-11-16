
## Usersテーブル

| Column     | Type    | Options      |
|------------|------------------------|
| nickname   | string  | null: false  |
| email      | string  | null: false  |
| password   | string  | null: false  |
| first-name | string  | null: false  |
| last-name  | string  | null: false  |
| First-name | string  | null: false  |
| Last-name  | string  | null: false  |
| birth-year | string  | null: false  |
| birth-month| string  | null: false  |
| birth-day  | string  | null: false  |

### Association

- has_many :item

## Itemsテーブル

| Column      | Type          | Options  |
|-------------|---------------|----------|
| image       |               |          |
| title       | text          | NOT NULL |
| explanation | text          | NOT NULL |
| category    | staring       | NOT NULL |
| status      | staring       | NOT NULL |
| delivery-fee| staring       | NOT NULL |
| area        | staring       | NOT NULL |
| days to ship| staring       | NOT NULL |
| user        | references    | NOT NULL |

### Association

- belong_to :user
- has_one :address
- has_one :card

## Addressテーブル

| Column       | Type     | Options  |
|--------------|----------|----------|
| postal code  | staring  | NOT NULL |
| pref         | staring  | NOT NULL |
| city         | staring  | NOT NULL |
| address code | staring  | NOT NULL |
| building     | staring  | NOT NULL |
| telephone    | staring  | NOT NULL |

### Association

- belong_to :item
- belong_to :card

## Cardsテーブル

| Column      | Type    | Options  |
|-------------|---------|----------|
| number      | staring | NOT NULL |
| limit month | staring | NOT NULL |
| limit years | staring | NOT NULL |
| cord        | staring | NOT NULL |

- belong_to :item
- belong_to :address




