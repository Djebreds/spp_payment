class Admins::Admin::BudgetSppsController < ApplicationController
  layout "admins/layouts/app"
  before_action :get_generation
  before_action :set_budget_spp, only: [:edit, :update, :destroy]
  
  def index
    respond_to do |format|
      format.html
      format.json { render json: BudgetSppDatatable.new(params) }
    end
  end

  def new
    @budget_spp = @generation.budget_spps.build
  end

  def create
    @budget_spp = @generation.budget_spps.build(budget_spp_params)
    if @budget_spp.save
      flash[:notice] = "Tahun berhasil ditambahkan"
      redirect_to admins_admin_generation_budget_spps_path(@generation)
    else
      flash[:alert] = "Tahun gagal ditambahkan"
      render :new
    end
  end

  def edit
    @generation = Generation.select('id', 'years').all
  end

  def update
    if @budget_spp.update(budget_spp_params)
      flash[:notice] = "Tahun berhasil diubah"
      redirect_to admins_admin_generation_budget_spps_path(@generation)
    else
      flash[:alert] = "Tahun gagal diubah"
      render :edit
    end
  end

  def destroy
    if @budget_spp.destroy
      flash[:notice] = "Tahun berhasil dihapus"
      redirect_to admins_admin_generation_budget_spps_path(@generation)
    else
      flash[:alert] = "Tahun gagal dihapus"
      redirect_to admins_admin_generation_budget_spps_path(@generation)
    end
  end

  private
  
  def get_generation
    @generation = Generation.find(params[:generation_id])
  end

  def set_budget_spp
    @budget_spp = @generation.budget_spps.find(params[:id])
  end

  def budget_spp_params
    params.require(:budget_spp).permit(:year, :generation_id)
  end

end
