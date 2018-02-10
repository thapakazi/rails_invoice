class InvoicesController < ApplicationController
  before_action :authorize, only: [:edit,:update,:destroy]
  before_action :find_invoice, only: [:show, :edit, :destroy, :update]
  def  find_invoice
    @invoice = Invoice.find(params[:id])
  end

  def index
    @invoices = Invoice.all.order("created_at DESC")
  end

  def show
  end
  
  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path
    else
      render 'new'
    end
    # render plain: params[:invoice].inspect
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to @invoice
    else
      render 'edit'
    end
  end

  def destroy
    @invoice.delete
    redirect_to invoices_path
  end

  def import
    Invoice.import(params[:file])
    redirect_to root_url, notice: "Invoices imported!"
  end
  
  private
  def invoice_params
    params.require(:invoice).permit(:item,:details,:price)
  end
     
end
