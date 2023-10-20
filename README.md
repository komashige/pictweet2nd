## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |



### Association

- has_many :tweets
- has_many :posts


## tweets テーブル

| Column         | Type    | Options     |
| ------         | ------  | ----------- |
| description    | text    | null: false |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## posts テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| tweet     | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :post
  belongs_to :comment

## comments テーブル

| Column           | Type       | Options      |
| -------          | ---------- | -------------|
| user             | references | null: false, foreign_key: true 
| tweet            | string     | null: false  |


### Association

- belongs_to :post
