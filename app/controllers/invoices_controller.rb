class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end
  def show
    @invoice = Invoice.find(params[:id])
  end
  
  def new
    @invoice = Invoice.new
  end
  def edit
    @invoice = Invoice.find(params[:id])
  end
  def create
    # render plain: params[:invoice].inspect

    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to @invoice
    else
      render 'new'
    end
    # render plain: params[:invoice].inspect
  end
  def update
    @invoice = Invoice.find(params[:id])
 
    if @invoice.update(invoice_params)
      redirect_to @invoice
    else
      render 'edit'
    end
  end
  private
  def invoice_params
    params.require(:invoice).permit(:item,:details,:price)
  end
     
end
