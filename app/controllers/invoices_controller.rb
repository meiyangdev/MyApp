class InvoicesController < ApplicationController
    def index
        @invoices = Invoice.all
    end
    def new
        @invoice = Invoice.new
    end
    private 
  def invoices_params 
    #params.require(:message).permit(:content) 
  end
end
