class Admins::Admin::PaymentMethodsController < ApplicationController
  before_action :set_payment_method, only: [:edit, :update, :destroy]
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: PaymentMethodDatatable.new(params) } 
    end
  end

  def new
    @payment_method = PaymentMethod.new
  end

  def create
    @payment_method = PaymentMethod.new(payment_method_params)

    if @payment_method.save
      flash[:notice] = "Metode pembayaran berhasil ditambahkan"
      redirect_to admins_admin_payment_methods_path
    else
      flash[:alert] = "Metode pembayaran gagal ditambahkan"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @payment_method.update(payment_method_params)
      flash[:notice] = "Metode pembayaran berhasil diubah"
      redirect_to admins_admin_payment_methods_path
    else
      flash[:alert] = "Metode pembayaran gagal diubah"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @payment_method.destroy!
      flash[:notice] = "Methode pembayaran berhasil dihapus"
      redirect_to admins_admin_payment_methods_path
    else
      flash[:alert] = "Methode pembayaran gagal dihapus"
      redirect_to admins_admin_payment_methods_path
    end
  end

  private

  def set_payment_method
    @payment_method = PaymentMethod.find(params[:id])
  end

  def payment_method_params
    params.require(:payment_method).permit(:name, :reference)
  end
end
