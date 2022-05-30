class InvoicesController < ApplicationController
    def index
        @invoices = Invoice.all
    end
    def new
        
        @invoice = Invoice.new
    end
    def create
      @invoice = Invoice.new(invoice_params)
      if @invoice.save
          redirect_to invoices_path
        else
          render 'new'
        end
    end
    def show
        @invoice = Invoice.find(params[:id])
    end
    def edit
        @invoice = Invoice.find(params[:id])
    end
    private 
  def invoice_params 
    params.require(:invoice).permit(:client_name,:invoice_id, :invoice_item, :quantity, :invoices_total,:expence_date) 
  end
end
