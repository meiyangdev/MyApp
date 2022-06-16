class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :client_id
      t.string :invoice_item
      t.decimal :quantity
      t.string :description
      t.decimal :invoices_total, precision: 10, scale: 2
      t.date :expence_date
      t.boolean :status

      t.timestamps
    end
  end
end
