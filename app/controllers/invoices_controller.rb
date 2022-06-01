class InvoicesController < ApplicationController
  
    def index
        @invoices = Invoice.all
    end
    def new
        
        @invoice = Invoice.new
    end
    def create
        @invoice = Invoice.new(invoice_params)
        @invoice.status = FALSE
        @invoice.uuid = SecureRandom.uuid
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
    def update
        @invoice = Invoice.find(params[:id])
        #byebug
         if @invoice.update_attributes(invoice_params)
          redirect_to(:action => 'show', :id => @invoice.id) 
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
        params.require(:invoice).permit(:client_name,:invoice_id, :price, :invoice_item, :quantity, :invoices_total,:expence_date) 
  end
end
