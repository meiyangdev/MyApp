class InvoicesController < ApplicationController
  def index
    @invoices = current_user.invoices
  end

  def new
    @invoice = Invoice.new
    @invoice.items.build
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)
    puts invoice_params
    @invoice.status = false
    @invoice.uuid = SecureRandom.uuid
    @invoice.invoices_total = invoice_params[:items_attributes].values.map do |item|
      # byebug
      item['price'].to_f * item['quantity'].to_f
    end.sum
    if @invoice.save
      redirect_to invoices_path
    else
      render 'new'
    end
  end

  # test = Invoice.create
  # test.id #=> 1
  # test.invoices_id #=> "INV00001"

  # test2 = Invoice.create
  # test2.id #=> 2
  # test2.invoices_id #=> "INV00002"

  def show
    @invoice = Invoice.find(params[:id])
    @client = @invoice
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    # byebug
    if @invoice.update_attributes(invoice_params)
      @item.invoices_total = @item.price * @item.quantity
      redirect_to(action: 'show', id: @invoice.id)
    else
      render 'edit'
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

  private

  def invoice_params
    params.require(:invoice).permit(:client_id, :invoice_id, :invoices_total,
                                    :expence_date, items_attributes: %i[price quantity invoice_item])
  end
end
