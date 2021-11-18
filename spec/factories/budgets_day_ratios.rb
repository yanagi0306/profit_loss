FactoryBot.define do
  factory :budgets_day_ratio do
    monday              {100}
    tuesday             {100}
    wednesday           {100}
    thursday            {100}
    friday              {100}
    saturday            {100}
    holiday             {100}
    association :store
  end
end
