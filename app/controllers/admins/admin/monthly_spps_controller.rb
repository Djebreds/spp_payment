class Admins::Admin::MonthlySppsController < ApplicationController
  layout "admins/layouts/app"
  before_action :get_generation, :get_budget_spp
  before_action :set_budget_spp, only: [:edit, :update]

  def index
    respond_to do |format|
      format.html
      format.json { render json: MonthlySppDatatable.new(params) }
    end
  end

  def edit
  end

  def update
    if @monthly_spp.update(monthly_spp_params)
      flash[:notice] = "Bulan berhasil diubah"
      redirect_to admins_admin_generation_budget_spp_monthly_spps(@generation, @budget_spp)
    else
      flash[:alert] = "Bulan gagal diubah"
      render :edit
    end
  end

  private

  def get_generation
    @generation = Generation.find(params[:generation_id])
  end

  def get_budget_spp
    @budget_spp = @generation.budget_spps.find(params[:budget_spp_id])
  end

  def set_monthly_spp
    @monthly_spp = @budget_spp.monthly_spps.find(params[:id])
  end

  def monthly_spp_params
    params.require(:monthly_spp).permit(:month, :amount)
  end

end
