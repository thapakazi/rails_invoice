class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end
  def show
    @invoice = Invoice.find(params[:id])
  end
  
  def new
  end
  def create
    # render plain: params[:invoice].inspect

    @invoice = Invoice.new(invoice_params)
    @invoice.save
    redirect_to @invoice
    # render plain: params[:invoice].inspect
  end
  private
  def invoice_params
    params.require(:invoice).permit(:item,:details,:price)
  end
     
end
