class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.datetime :payment_date, null: false
      t.datetime :confirmation_date
      t.decimal :total, null: false
      t.text :description
      t.integer :status, default: 0, null: false

      t.references :student, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true
      t.references :budget_spp, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.timestamps
    end
  end
end
