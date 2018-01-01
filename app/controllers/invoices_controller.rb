class InvoicesController < ApplicationController
  def new
  end
  def create
    render plain: params[:invoice].inspect
  end
end
