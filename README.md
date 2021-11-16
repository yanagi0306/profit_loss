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
| company_id         | references| null:false,foreign_key: true  |

### Association

- has_many :achievements
- has_many :budgets
- belongs_to :company


## Budgetsテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| ymd                | date       | null:false,unique:true        |
| water              | integer    |                               |
| gas                | integer    |                               |
| electric           | integer    |                               |
| rent               | integer    |                               |
| income             | integer    |                               |
| sales              | integer    |                               |
| lunch_sale         | integer    |                               |
| dinner_sale        | integer    |                               |
| part_cost          | integer    |                               |
| employee_cost      | integer    |                               |
| food_cost          | integer    |                               |
| other              | integer    |                               |
| fixed_cost_id      | references | foreign_key: true             |
| store_id           | references | foreign_key: true             |
| budget_day_ratio_id| references | foreign_key: true             |




### Association

- belongs_to :fixed_cost
- belongs_to :store
- belongs_to : budget_day_ratio


## Achievementsテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| ymd                | date       | null:false,unique:true        |
| water              | integer    | null:false                    |
| gas                | integer    | null:false                    |
| electric           | integer    | null:false                    |
| rent               | integer    | null:false                    |
| income             | integer    | null:false                    |
| sales              | integer    | null:false                    |
| lunch_sales        | integer    | null:false                    |
| dinner_sales       | integer    | null:false                    |
| part_cost          | integer    | null:false                    |
| employee_cost      | integer    | null:false                    |
| food_cost          | integer    | null:false                    |
| other              | integer    | null:false                    |
| income_id          | references | foreign_key: true             |
| variable_cost_id   | references | foreign_key: true             |
| fixed_cost_id      | references | foreign_key: true             |
| sales_id           | references | foreign_key: true             |
| store_id           | references | foreign_key: true             |




### Association

- has_one :incom
- has_one :variable_cost
- has_one :fixed_cost
- has_one :sales
- belongs_to :store




## incomesテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| price              | integer    | null:false                    |
| ymd                | date       | null:false                    |
| memo               | text       |                               |


### Association

- belongs_to :achievement


## Storesテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null:false                     |
| ymd                | date       | null:false,unique:true         |
| lunch_sales        | integer    | null:false                     |
| dinner_sales       | integer    | null:false                     |


### Association


- belongs_to :achievement



## Fixed_costsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null:false                     |
| fixed_category_id  | integer    | null:false                     |
| start_date         | date       | null:false                     |
| end_date           | date       | null:false                     |
| memo               | text       |                                |
| budget_day_ratio_id| references | null:false,foreign_key: true   |


### Association


- has_many :achievements
- has_many :budgets
- belongs_to : budget_day_ratio


## Variable_costsテーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| price               | integer    | null:false                     |
| variable_category_id| integer    | null:false                     |
| ymd                 | integer    | null:false                     |
| memo                | text       |                                |


### Association


- belongs_to :achievement

## Budget_day_ratiosテーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| sunday              | integer    | null:false                     |
| monday              | integer    | null:false                     |
| tuesday             | integer    | null:false                     |
| wednesday           | integer    | null:false                     |
| thursday            | integer    | null:false                     |
| friday              | integer    | null:false                     |
| saturday            | integer    | null:false                     |
| holiday             | integer    | null:false                     |



### Association


- has_many :budget
- has_many :fixed_cost
