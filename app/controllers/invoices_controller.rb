class InvoicesController < ApplicationController
    def index
        @invoices = Invoice.all
    end
    def new
        
        @invoice = Invoice.new
    end
    def create
        @invoice = Invoice.new(invoice_params)
       
        @invoice.invoices_total = @invoice.price * @invoice.quantity
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
    end
    def edit
        @invoice = Invoice.find(params[:id])
    end
    private 
  def invoice_params 
        params.require(:invoice).permit(:client_name,:invoice_id, :price, :invoice_item, :quantity, :invoices_total,:expence_date) 
  end
end
