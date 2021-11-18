# テーブル設計

## Companiesテーブル　

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null:false                |
| email              | string | null:false,unique:true    |
| encrypted_password | string | null:false                |

### Association

- has_many :stores

## Storesテーブル　

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| name               | string    | null:false                    |
| email              | string    | null:false,unique:true        |
| encrypted_password | string    | null:false                    |
| company            | references| null:false,foreign_key: true  |

### Association

- has_many :achievements
- has_many :budgets
- belongs_to :company
- has_many :budgets_day_ratio


## Budgetsテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| ymd                | date       | null:false,unique:true        |
| water              | integer    |                               |
| gas                | integer    |                               |
| electric           | integer    |                               |
| income             | integer    |                               |
| sale               | integer    |                               |
| lunch_sale         | integer    |                               |
| dinner_sale        | integer    |                               |
| part_cost          | integer    |                               |
| employee_cost      | integer    |                               |
| food_cost          | integer    |                               |
| other              | integer    |                               |
| employee_cost      | integer    |                               |
| rent               | integer    |                               |
| store              | references | foreign_key: true             |
| budget_day_ratio   | references | foreign_key: true             |




### Association

- belongs_to :store
- belongs_to : budget_day_ratio


## Achievementsテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| ymd                | date       | null:false,unique:true        |
| water              | integer    |                               |
| gas                | integer    |                               |
| electric           | integer    |                               |
| rent               | integer    |                               |
| income             | integer    |                               |
| sales              | integer    |                               |
| lunch_sales        | integer    |                               |
| dinner_sales       | integer    |                               |
| part_cost          | integer    |                               |
| food_cost          | integer    |                               |
| other              | integer    |                               |
| employee_cost      | integer    |                               |
| rent               | integer    |                               |
| store              | references | foreign_key: true             |




### Association

- has_one :income
- has_one :variable_cost
- belongs_to :store




## incomesテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| price              | integer    | null:false                    |
| ymd                | date       | null:false, unique: true      |
| memo               | text       |                               |


### Association

- belongs_to :achievement


## salesテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null:false                     |
| ymd                | date       | null:false,unique:true         |
| lunch_sales        | integer    | null:false                     |
| dinner_sales       | integer    | null:false                     |
| achievement        | references | null: false, foreign_key: true |

### Association


- belongs_to :achievement



## Variable_costsテーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| price               | integer    | null:false                     |
| variable_category_id| integer    | null:false                     |
| ymd                 | date       | null:false                     |
| achievement         | references | null:false,foreign_key: true   |


### Association


- belongs_to :achievement

## Budget_day_ratiosテーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| monday              | integer    | null:false                     |
| tuesday             | integer    | null:false                     |
| wednesday           | integer    | null:false                     |
| thursday            | integer    | null:false                     |
| friday              | integer    | null:false                     |
| saturday            | integer    | null:false                     |
| holiday             | integer    | null:false                     |
| store               | references | null:false,foreign_key: true              |


### Association


- has_many :budgets
- belongs_to :store
