class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_number
      t.string :client_name
      t.decimal :invoices_total
      t.date :expence_date

      t.timestamps
    end
  end
end
