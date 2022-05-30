class AddPricesToInvoice < ActiveRecord::Migration[6.0]
  def change
    remove_column :invoices, :description, :string
    add_column :invoices, :price, :decimal
  end
end
