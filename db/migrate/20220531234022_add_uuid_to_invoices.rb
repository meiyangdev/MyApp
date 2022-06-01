class AddUuidToInvoices < ActiveRecord::Migration[6.0]
  def change
     add_column :invoices, :uuid, :string
  end
end
