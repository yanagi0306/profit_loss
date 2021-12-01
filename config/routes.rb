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
    end
  end
  resource :budgets,only: [:edit,:update]
  resources :budgets_day_ratios, only: [:new,:create]
  resource :incomes,only: [:edit,:update]
  resource :sales, only: [:edit,:update]
  resource :variable_costs, only: [:edit,:update]
end
