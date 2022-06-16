class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :invoice_item
      t.decimal :quantity
      t.decimal :price, precision: 10, scale: 2
      t.belongs_to :invoice, foreign_key: true
      t.timestamps
    end
  end
end
