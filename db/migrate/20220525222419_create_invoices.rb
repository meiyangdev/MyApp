class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_id 
      t.integer :user_id
      t.string :client_name
      t.string :invoice_item
      t.decimal :quantity
      t.string :description
      t.decimal :invoices_total
      t.date :expence_date
      t.boolean :status

      t.timestamps
    end
  end
end
