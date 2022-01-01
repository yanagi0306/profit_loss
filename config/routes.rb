Rails.application.routes.draw do
  devise_for :stores,
             controllers: {
               registrations: 'stores/registrations',
               sessions: 'stores/sessions',
             }
  devise_for :companies,
             controllers: {
               registrations: 'companies/registrations',
               sessions: 'companies/sessions',
             }
  root to: 'stores#index'

  resources :stores, only: [:index] do
    member do
      get 'search'
      get 'day_search'
    end
  end

  resource :budgets,only: [:edit,:update]
  resources :budgets_day_ratios, only: [:new,:create]

  resource :achievement,only: [:edit,:update]

  resources :settlement_fee_subject,only: [:edit,:update]
  resources :day_settlement_fee,only: [:edit,:update]
  resources :month_settlement_fee,only: [:edit,:update]

  resources :delivery_commission_subject,only: [:edit,:update]
  resources :day_delivery_commission,only: [:edit,:update]
  resources :month_delivery_commission,only: [:edit,:update]



end
