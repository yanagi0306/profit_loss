# FoodJournal 紹介資料

## アプリケーション名

FoodJournal

## URL

[52.198.70.166](http://52.198.70.166/)

## Basic 認証

ID:admin<br>
Pass：2222

## テスト用会社アカウント

name:有限会社ティーツー<br>
Pass:aaa111

## テスト用店舗アカウント

name:馬鹿豚や<br>
Pass:ccc333

## Github リポジトリ

https://github.com/yanagi0306/profit_loss.git

## 動作確認方法

1.遷移先の店舗ログインページからログインを行なってください<br>
2.サイドバーより収支を入力する<br>
3.入力後月次日次情報を確認できます

## 今後実装予定の機能

① 月次、日次情報の CSV 出力<br>
② 小口金管理機能と業者別の仕入管理機能<br>
③ 会社全体での日次月次の閲覧機能

## オリジナルアプリ作成を経ての気づき

### 工夫した点

飲食業での経験からなるべく通常業務の負担にならない入力工程を考えつつ作成しました。<br>
また入力ミスを防ぐため入力フォームは基本的に１ヶ月分表示し、他の日と金額を見比べつつ入力できるように作成しました。<br>

### 感想

この度のアプリ開発は知人の飲食店経営者の協力の中作成を開始しました。<br>
対お客様がいる中での開発という、実際の開発現場のような環境でアプリ開発をすることができ、得難い経験を得ることができたと感じています。<br>
知人とのミーティングではさまざまな提案を受け、その都度設計変更を行い苦労しましたが最終的には一定の満足をいただけるアプリを作ることができました。<br>
また知人からの提案にお答えできていない機能も多々あり自分の知識不足、経験不足を強く実感することもできました。<br>
今後も技術研鑽を続け、一人前のエンジニアになるべく努力を継続していきたいと考えています。

## 開発環境

・フロントエンド : HTML,CSS / JavaScript<br>
・バックエンド : Ruby (ver 2.51) / Ruby on Rails (ver 6.04),Chart.js<br>
・インフラ : AWS (EC2)<br>
・テキストエディタ : Visual Studio Code<br>
・タスク管理 : GitHub プロジェクトボード

## ローカルでの作動方法

以下、コマンドを順に実行してください<br>
% git clone https://github.com/yanagi0306/profit_loss.git<br>
% cd profit_loss<br>
% bundle install<br>
% yarn install<br>
% rails db:create<br>
% rails s

## デモ 実績入力
![実績入力 (1)](https://user-images.githubusercontent.com/82252568/146182445-b3702886-775d-4162-93f6-e1a941eb53e9.gif)

## デモ 日次情報
![AnyConv com__画面収録 2021-12-15 21 27 25-1](https://user-images.githubusercontent.com/82252568/146188877-01ad03f3-cb97-4345-9ec0-5f0db6ca9b77.gif)
## 遷移図

<img width="752" alt="スクリーンショット 2021-12-13 2 04 14" src="https://user-images.githubusercontent.com/82252568/145927240-5780a852-ca48-4a18-a123-e76ddf7e225b.png">

## データベース設計
### Companies テーブル　

| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| name               | string | null:false             |
| email              | string | null:false,unique:true |
| encrypted_password | string | null:false             |

#### Association

- has_many :stores

### Stores テーブル　

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| name               | string     | null:false                   |
| email              | string     | null:false,unique:true       |
| encrypted_password | string     | null:false                   |
| company            | references | null:false,foreign_key: true |

#### Association

- has_many :achievements
- has_many :budgets
- belongs_to :company

### Budgets テーブル

| Colum                       | Type       | Options                      |
| --------------------------- | ---------- | ---------------------------- |
| ymd                         | date       | null:false,unique:true       |
| sale                        | integer    |                              |
| lunch_sale                  | integer    |                              |
| dinner_sale                 | integer    |                              |
| interest_income             | integer    |                              |
| miscellaneous_income        | integer    |                              |
| overtime_employee_cost      | integer    |                              |
| social_insurance_part       | integer    |                              |
| communications_variable     | integer    |                              |
| publicity_variable          | integer    |                              |
| social                      | integer    |                              |
| meeting                     | integer    |                              |
| traveling                   | integer    |                              |
| selling_administration_cost | integer    |                              |
| garbage_variable            | integer    |                              |
| car_variable                | integer    |                              |
| clean_variable              | integer    |                              |
| credit_variable             | integer    |                              |
| delivery_variable           | integer    |                              |
| electric                    | integer    |                              |
| water                       | integer    |                              |
| gas                         | integer    |                              |
| power                       | integer    |                              |
| food_cost                   | integer    |                              |
| material_cost               | integer    |                              |
| interest_payment            | integer    |                              |
| welfare_fixed               | integer    |                              |
| communications_fixed        | integer    |                              |
| publicity_fixed             | integer    |                              |
| clean_fixed                 | integer    |                              |
| car_fixed                   | integer    |                              |
| credit_fixed                | integer    |                              |
| delivery_variable           | integer    |                              |
| rent                        | integer    |                              |
| employee_cost               | integer    |                              |
| director_cost               | integer    |                              |
| company_interest            | integer    |                              |
| social_insurance_employee   | integer    |                              |
| resident_tax                | integer    |                              |
| pos_system                  | integer    |                              |
| garbage_variable            | integer    |                              |
| borrowing                   | integer    |                              |
| tax_counsellor              | integer    |                              |
| labor_counsellor            | integer    |                              |
| miscellaneous_income        | integer    |                              |
| store                       | references | null:false,foreign_key: true |
| budget_day_ratio            | references | null:false,foreign_key: true |

#### Association

- belongs_to :store
- belongs_to :budget_day_ratio

### Achievements テーブル

| Colum                       | Type       | Options                      |
| --------------------------- | ---------- | ---------------------------- |
| ymd                         | date       | null:false,unique:true       |
| sale                        | integer    |                              |
| lunch_sale                  | integer    |                              |
| dinner_sale                 | integer    |                              |
| interest_income             | integer    |                              |
| miscellaneous_income        | integer    |                              |
| overtime_employee_cost      | integer    |                              |
| social_insurance_part       | integer    |                              |
| communications_variable     | integer    |                              |
| publicity_variable          | integer    |                              |
| social                      | integer    |                              |
| meeting                     | integer    |                              |
| traveling                   | integer    |                              |
| selling_administration_cost | integer    |                              |
| garbage_variable            | integer    |                              |
| car_variable                | integer    |                              |
| clean_variable              | integer    |                              |
| credit_variable             | integer    |                              |
| delivery_variable           | integer    |                              |
| electric                    | integer    |                              |
| water                       | integer    |                              |
| gas                         | integer    |                              |
| power                       | integer    |                              |
| food_cost                   | integer    |                              |
| material_cost               | integer    |                              |
| interest_payment            | integer    |                              |
| welfare_fixed               | integer    |                              |
| communications_fixed        | integer    |                              |
| publicity_fixed             | integer    |                              |
| clean_fixed                 | integer    |                              |
| car_fixed                   | integer    |                              |
| credit_fixed                | integer    |                              |
| delivery_variable           | integer    |                              |
| rent                        | integer    |                              |
| employee_cost               | integer    |                              |
| director_cost               | integer    |                              |
| company_interest            | integer    |                              |
| social_insurance_employee   | integer    |                              |
| resident_tax                | integer    |                              |
| pos_system                  | integer    |                              |
| garbage_variable            | integer    |                              |
| borrowing                   | integer    |                              |
| tax_counsellor              | integer    |                              |
| labor_counsellor            | integer    |                              |
| store                       | references | null:false,foreign_key: true |

#### Association

- has_one :sale
- has_many :incomes
- has_many :variable_costs
- belongs_to :store

### Incomes テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    |                                |
| ymd                | date       | null:false                     |
| income_category_id | integer    | null:false                     |
| achievement        | references | null: false, foreign_key: true |
| store              | references | null:false,foreign_key: true   |

#### Association

- belongs_to :achievement
- belongs_to :store

### Sales テーブル

| Colum        | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| sale         | integer    |                                |
| ymd          | date       | null:false                     |
| lunch_sale   | integer    |                                |
| dinner_sale  | integer    |                                |
| lunch_number | integer    |                                |
| dinner_number| integer    |                                |
| achievement  | references | null: false, foreign_key: true |
| store        | references | null:false,foreign_key: true   |

#### Association

- belongs_to :achievement
- belongs_to :store

### Variable_costs テーブル

| Colum                       | Type       | Options                      |
| --------------------------- | ---------- | ---------------------------- |
| overtime_employee_cost      | integer    |                              |
| social_insurance_part       | integer    |                              |
| communications_variable     | integer    |                              |
| publicity_variable          | integer    |                              |
| social                      | integer    |                              |
| meeting                     | integer    |                              |
| traveling                   | integer    |                              |
| selling_administration_cost | integer    |                              |
| garbage_variable            | integer    |                              |
| car_variable                | integer    |                              |
| clean_variable              | integer    |                              |
| credit_variable             | integer    |                              |
| delivery_variable           | integer    |                              |
| electric                    | integer    |                              |
| water                       | integer    |                              |
| gas                         | integer    |                              |
| power                       | integer    |                              |
| food_cost                   | integer    |                              |
| material_cost               | integer    |                              |
| interest_payment            | integer    |                              |
| ymd                         | date       | null:false                   |
| achievement                 | references | null:false,foreign_key: true |
| store                       | references | null:false,foreign_key: true |

#### Association

- belongs_to :achievement
- belongs_to :store

### Budget_day_ratios テーブル

| Colum     | Type       | Options                      |
| --------- | ---------- | ---------------------------- |
| monday    | integer    | null:false                   |
| tuesday   | integer    | null:false                   |
| wednesday | integer    | null:false                   |
| thursday  | integer    | null:false                   |
| friday    | integer    | null:false                   |
| saturday  | integer    | null:false                   |
| holiday   | integer    | null:false                   |
| store     | references | null:false,foreign_key: true |

#### Association

- has_many :budgets
- belongs_to :store
