class AddMonthlySppToPayment < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :monthly_spp, null: false, foreign_key: true
  end
end
