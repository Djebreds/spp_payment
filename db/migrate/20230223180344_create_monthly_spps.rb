class CreateMonthlySpps < ActiveRecord::Migration[7.0]
  def change
    create_table :monthly_spps do |t|
      t.string :year, null: false
      t.decimal :januari, null: false
      t.decimal :februari, null: false
      t.decimal :maret, null: false
      t.decimal :april, null: false
      t.decimal :mei, null: false
      t.decimal :juni, null: false
      t.decimal :juli, null: false
      t.decimal :agustus, null: false
      t.decimal :september, null: false
      t.decimal :oktober, null: false
      t.decimal :november, null: false
      t.decimal :desember, null: false
      
      t.timestamps
    end
  end
end
