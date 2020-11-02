# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
* has_many :items
* has_many :comments

## ideas テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_many :comments
## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| idea_id | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :idea
