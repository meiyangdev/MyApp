class Invoice < ApplicationRecord
  belongs_to :client, optional: true
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items
  def invoice_number
    'INV%05d' % id
  end
end
