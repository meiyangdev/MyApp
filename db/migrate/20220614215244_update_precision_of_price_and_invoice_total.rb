class UpdatePrecisionOfPriceAndInvoiceTotal < ActiveRecord::Migration[6.0]
  def change
      remove_column :items, :price, :decimal
      add_column :invoices, :price, :decimal, precision: 10, scale: 2
      remove_column :invoices, :invoices_total, :decimal
      add_column :invoices, :invoices_total, :decimal, precision: 10, scale: 2
  end
end
