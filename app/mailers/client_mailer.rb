class ClientMailer < ApplicationMailer
  default from: 'mei@hnry.co.nz'
  def invoice_send_mail(invoice)
    @invoice = invoice

    mail(to: @invoice.client.email, subject: 'You got a new invoice.')
  end
end
