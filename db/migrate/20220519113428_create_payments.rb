class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
