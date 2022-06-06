class ClientMailer < ApplicationMailer
  def invoice_email
    @client = client
    @invoice = params[:invoice]

    mail(to: @client.email, subject: 'You got a new invoice.')
  end
end
