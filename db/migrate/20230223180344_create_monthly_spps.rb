class CreateMonthlySpps < ActiveRecord::Migration[7.0]
  def change
    create_table :monthly_spps do |t|
      t.string :month, null: false
      t.decimal :amount, default: 0, null: false
      
      t.timestamps
    end
  end
end
