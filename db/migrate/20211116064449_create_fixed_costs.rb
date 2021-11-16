class CreateFixedCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :fixed_costs do |t|

      t.timestamps
    end
  end
end
