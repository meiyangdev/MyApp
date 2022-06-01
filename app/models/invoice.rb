class Invoice < ApplicationRecord
    belongs_to :client, optional: true
    def invoice_number
        "INV%05d" % id
    end
end
