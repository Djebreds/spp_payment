class AddBudgetSppToMonthlySpp < ActiveRecord::Migration[7.0]
  def change
    add_reference :monthly_spps, :budget_spp, null: false, foreign_key: true
  end
end
