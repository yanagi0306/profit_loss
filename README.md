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


## Budgetsテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| ymd                | date       | null:false,unique:true        |
| water              | integer    |                               |
| gas                | integer    |                               |
| electric           | integer    |                               |
| rent               | integer    |                               |
| income             | integer    |                               |
| sale              | integer    |                               |
| lunch_sale         | integer    |                               |
| dinner_sale        | integer    |                               |
| part_cost          | integer    |                               |
| employee_cost      | integer    |                               |
| food_cost          | integer    |                               |
| other              | integer    |                               |
| store              | references | foreign_key: true             |
| budget_day_ratio   | references | foreign_key: true             |




### Association

- has_many :fixed_costs
- has_many :fixed_cost_budgets
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
| sales               | integer    | null:false                   |
| lunch_sales         | integer    | null:false                   |
| dinner_sales        | integer    | null:false                   |
| part_cost          | integer    | null:false                    |
| employee_cost      | integer    | null:false                    |
| food_cost          | integer    | null:false                    |
| other              | integer    | null:false                    |
| store              | references | foreign_key: true             |




### Association

- has_one :income
- has_one :variable_cost
- has_many :fixed_costs
- has_many :fixed_cost_achievements
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



## Fixed_costsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null:false                     |
| fixed_category_id  | integer    | null:false                     |
| start_date         | date       | null:false                     |
| end_date           | date       | null:false                     |
| budget_day_ratio  | references | null:false,foreign_key: true    |


### Association


- has_many :achievements
- has_many :fixed_cost_achievements
- has_many :budgets
- has_many :fixed_cost_budget
- belongs_to : budget_day_ratio


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



### Association


- has_many :budgets
- has_many :fixed_costs


## fixed_cost_budgetsテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| budget             | references | null:false,foreign_key: true  |
| fixed_cost         | references | null:false,foreign_key: true  |


### Association

- belongs_to :budget
- belongs_to :fixed_cost

## fixed_cost_ achievementsテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| achievement        | references | null:false,foreign_key: true  |
| fixed_cost         | references | null:false,foreign_key: true  |



### Association

- belongs_to :achievement
- belongs_to :fixed_cost
