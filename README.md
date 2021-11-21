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

| Colum                       | Type       | Options                       |
| --------------------------- | ---------- | ----------------------------- |
| ymd                         | date       | null:false,unique:true        |
| sale_value                  | integer    |                               |
| lunch_value                 | integer    |                               |
| dinner_value                | integer    |                               |
| interest_income             | integer    |                               |
| miscellaneous_income        | integer    |                               |
| overtime_employee_cost      | integer    |                               |
| social_insurance_part       | integer    |                               |
| communications_variable     | integer    |                               |
| publicity_variable          | integer    |                               |
| social                      | integer    |                               |
| meeting                     | integer    |                               |
| traveling                   | integer    |                               |
| selling_administration_cost | integer    |                               |
| garbage_variable            | integer    |                               |
| car_variable                | integer    |                               |
| clean_variable              | integer    |                               |
| credit_variable             | integer    |                               |
| delivery_variable           | integer    |                               |
| electric                    | integer    |                               |
| water                       | integer    |                               |
| gas                         | integer    |                               |
| power                       | integer    |                               |
| welfare_fixed               | integer    |                               |
| communications_fixed        | integer    |                               |
| publicity_fixed             | integer    |                               |
| clean_fixed                 | integer    |                               |
| car_fixed                   | integer    |                               |
| credit_fixed                | integer    |                               |
| delivery_variable           | integer    |                               |
| rent                        | integer    |                               |
| employee_cost               | integer    |                               |
| director_cost               | integer    |                               |
| company_interest            | integer    |                               |
| interest_payment            | integer    |                               |
| social_insurance_employee   | integer    |                               |
| resident_tax                | integer    |                               |
| pos_system                  | integer    |                               |
| garbage_variable            | integer    |                               |
| borrowing                   | integer    |                               |
| tax_counsellor              | integer    |                               |
| labor_counsellor            | integer    |                               |
| store                       | references | null:false,foreign_key: true  |
| budget_day_ratio            | references | null:false,foreign_key: true  |




### Association

- belongs_to :store
- belongs_to : budget_day_ratio


## Achievementsテーブル

| Colum                       | Type       | Options                       |
| --------------------------- | ---------- | ----------------------------- |
| ymd                         | date       | null:false,unique:true        |
| sale_value                  | integer    |                               |
| lunch_value                 | integer    |                               |
| dinner_value                | integer    |                               |
| interest_income             | integer    |                               |
| miscellaneous_income        | integer    |                               |
| overtime_employee_cost      | integer    |                               |
| social_insurance_part       | integer    |                               |
| communications_variable     | integer    |                               |
| publicity_variable          | integer    |                               |
| social                      | integer    |                               |
| meeting                     | integer    |                               |
| traveling                   | integer    |                               |
| selling_administration_cost | integer    |                               |
| garbage_variable            | integer    |                               |
| car_variable                | integer    |                               |
| clean_variable              | integer    |                               |
| credit_variable             | integer    |                               |
| delivery_variable           | integer    |                               |
| electric                    | integer    |                               |
| water                       | integer    |                               |
| gas                         | integer    |                               |
| power                       | integer    |                               |
| welfare_fixed               | integer    |                               |
| communications_fixed        | integer    |                               |
| publicity_fixed             | integer    |                               |
| clean_fixed                 | integer    |                               |
| car_fixed                   | integer    |                               |
| credit_fixed                | integer    |                               |
| delivery_variable           | integer    |                               |
| rent                        | integer    |                               |
| employee_cost               | integer    |                               |
| director_cost               | integer    |                               |
| company_interest            | integer    |                               |
| interest_payment            | integer    |                               |
| social_insurance_employee   | integer    |                               |
| resident_tax                | integer    |                               |
| pos_system                  | integer    |                               |
| garbage_variable            | integer    |                               |
| borrowing                   | integer    |                               |
| tax_counsellor              | integer    |                               |
| labor_counsellor            | integer    |                               |
| store                       | references | null:false,foreign_key: true  |





### Association

- has_many :income
- has_many :food_costs
- has_many :material_costs
- has_many :variable_cost
- belongs_to :store




## incomesテーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| price              | integer    | null:false                    |
| ymd                | date       | null:false, unique: true      |
| income_category_id | integer    | null:false                    |
| achievement        | references | null: false, foreign_key: true|

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


## food_costsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null:false                     |
| ymd                | date       | null:false,unique:true         |
| achievement        | references | null: false, foreign_key: true |
| food_category      | references | null: false, foreign_key: true |

### Association


- belongs_to :achievement
- belongs_to :food_category

## food_categorysテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null:false,unique:true         |


### Association


- has_many :food_costs


## material_costsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null:false                     |
| ymd                | date       | null:false,unique:true         |
| achievement        | references | null: false, foreign_key: true |
| material_category  | references | null: false, foreign_key: true |

### Association


- belongs_to :achievement
- belongs_to :material_category

## material_categorysテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null:false,unique:true         |


### Association


- has_many :material_categorys



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
