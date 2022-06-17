class InvoicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :view_invoice
  def index
    @invoices = current_user.invoices
  end

  def new
    @invoice = Invoice.new
    @invoice.items.build
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)
    @invoice.uuid = SecureRandom.uuid
    @invoice.invoices_total = invoice_params[:items_attributes].values.map do |item|
      item['price'].to_f * item['quantity'].to_f
    end.sum

    if @invoice.save
      redirect_to invoices_path
    else
      render 'new'
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    @client = @invoice
  end

  def edit
    @invoice = current_user.invoices.find(params[:id])
  end

  def update
    @invoice = current_user.invoices.find(params[:id])
    @invoice.invoices_total = invoice_params[:items_attributes].values.map do |item|
      item['price'].to_f * item['quantity'].to_f
    end.sum
    if @invoice.update(invoice_params)
      redirect_to(action: 'show', id: @invoice.id)
    else
      render 'index'
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end

  def view_invoice
    @invoice = Invoice.find_by(uuid: params[:uuid])
  end

  def send_invoice_mail
    @invoice = Invoice.find(params[:invoice_id])

    ClientMailer.invoice_send_mail(@invoice).deliver
    flash[:notice] = 'Invoice has been sent.'
    @invoice.update(status: 1)
    redirect_to invoices_path
  end

  private

  def invoice_params
    params.require(:invoice).permit(:id, :client_id, :user_id, :invoices_total, :expence_date,
                                    items_attributes: %i[id price quantity invoice_item invoice_id _destroy])
  end
end
