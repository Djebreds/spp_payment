class Admins::Staff::HistoryPaymentsController < ApplicationController

  layout "admins/staff/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: HistroyPaymentDatatableDatatable.new(params) }
    end
  end
end
