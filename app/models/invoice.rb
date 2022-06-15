class Invoice < ApplicationRecord
  belongs_to :client
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items
  def invoice_number
    'INV%05d' % id
  end
  enum status: {
    draft: 0,
    published: 1,
    paid: 2
  }
end
