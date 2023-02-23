class CreateBudgetSpps < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_spps do |t|
      t.references :generation, null: false, foreign_key: true
      t.references :monthly_spp, null: false, foreign_key: true
      t.timestamps
    end
  end
end
