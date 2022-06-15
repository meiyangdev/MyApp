class AddStatusAndDropPriceQuantityItemToInvoices < ActiveRecord::Migration[6.0]
  def change
    remove_column :invoices, :invoice_item, :string
    remove_column :invoices, :quantity, :decimal
    remove_column :invoices, :price, :decimal
    remove_column :invoices, :status, :boolean
    add_column :invoices, :status, :integer, default: 0
  end
end
