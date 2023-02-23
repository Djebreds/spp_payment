class CreatePaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_methods do |t|
      t.string :name, null: false
      t.string :reference
      
      t.timestamps
    end
  end
end
