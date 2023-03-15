class Admins::Admin::PaymentsController < ApplicationController
  before_action :authenticate_admin!
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
    # @students = Student.includes(:class_room_major).all.group_by { |student| student.class_room_major.class_major }
    # @budget_spps = Student.select('budget_spps.id', 'budget_spps.year', 'sum(monthly_spps.amount) AS total').joins(generation: [budget_spps: :monthly_spps]).where('students.id = ?', params[:student_id]).group('budget_spps.id')
    # @monthly_spps = BudgetSpp.select('monthly_spps.month', 'monthly_spps.amount').joins(:monthly_spps).where('budget_spps.id = ?', params[:generation_id])
  end

  def update_budget
    budget_spps = Student.select('budget_spps.id', 'budget_spps.year', 'sum(monthly_spps.amount) AS total').joins(generation: [budget_spps: :monthly_spps]).where('students.id = ? ', params[:student_id]).group('budget_spps.id')
    
    render json: { budget_spps: budget_spps }
  end

  def update_monthly
    monthly_spps = BudgetSpp.select('monthly_spps.id', 'monthly_spps.month', 'monthly_spps.amount').joins(:monthly_spps).where('budget_spps.id = ?', params[:budget_spp_id])

    render json: { monthly_spps: monthly_spps }
  end

  def create
    @payment = Payment.new(payment_params.merge(
      admin_id: current_admin.id, 
      payment_date: DateTime.current.strftime("%A, %e %B %Y %H:%M:%S %p"), 
      confirmation_date: DateTime.current.strftime("%A, %e %B %Y %H:%M:%S %p"),
      status: :completed))

    if @payment.save!
      flash[:notice] = "Transaksi berhasil ditambahkan"
      redirect_to admins_admin_payments_path
    else
      flash[:alert] = "Transaksi gagal ditambahkan"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @budget_spps = BudgetSpp.find(:all)
  end

  def update
    if @payment.update(payment_params.merge(
      admin_id: current_admin.id, 
      payment_date: DateTime.current.strftime("%A, %e %B %Y %H:%M:%S %p"), 
      confirmation_date: DateTime.current.strftime("%A, %e %B %Y %H:%M:%S %p"),
      status: :completed
      ))
      
      flash[:notice] = "Transaksi berhasil diubah"
      redirect_to admins_admin_payments_path
    else
      flash[:alert] = "Transaksi gagal diubah"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @payment.destroy!
      flash[:notice] = "Transaksi berhasil dihapus"
      redirect_to admins_admin_payments_path
    else
      flash[:alert] = "Transaksi gagal dihapus"
      redirect_to admins_admin_payments_path
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:monthly_spp_id, :student_id, :budget_spp_id, :total, :admin_id, )
  end

end
