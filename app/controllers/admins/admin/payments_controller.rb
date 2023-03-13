class Admins::Admin::PaymentsController < ApplicationController
  before_action :set_payment, only: [:edit, :update, :destroy]
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: PaymentDatatable.new(params) }
    end
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      flash[:notice] = "Transaksi berhasil ditambahkan"
      redirect_to admins_admin_payments
    else
      flash[:alert] = "Transaksi gagal ditambahkan"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @payment.update(payment_params)
      flash[:notice] = "Transaksi berhasil diubah"
      redirect_to admins_admin_payments
    else
      flash[:alert] = "Transaksi gagal diubah"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @payment.destroy!
      flash[:notice] = "Transaksi berhasil dihapus"
      redirect_to admins_admin_payments
    else
      flash[:alert] = "Transaksi gagal dihapus"
      redirect_to admins_admin_payments
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:student_id, :payment_method_id, :budget_spp_id, :admin_id, :total)
  end

end
