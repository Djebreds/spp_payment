class Admins::Admin::Categories::GenerationsController < ApplicationController
  before_action :set_generation, only: [:edit, :update, :destroy]
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html 
      format.json { render json: GenerationDatatable.new(params) }
    end
  end

  def new
    @generation = Generation.new
  end

  def create
    @generation = Generation.new(generation_params)
    
    if @generation.save
      flash[:notice] = "Generasi baru berhasil ditambahkan"
      redirect_to admins_admin_categories_generations_path
    else
      flash[:alert] = "Generasi gagal ditambahkan"
      render :new
    end
  end

  def edit
  end

  def update
    if @generation.update(generation_params)
      flash[:notice] = "Generasi berhasil diubah"
      redirect_to admins_admin_categories_generations_path
    else
      flash[:alert] = "Generasi gagal diubah"
      render :edit
    end
  end

  def destroy
    if @generation.destroy!
      flash[:notice] = "Generasi berhasil dihapus"
      redirect_to admins_admin_categories_generations_path
    else
      flash[:alert] = "Generasi gagal dihapus"
      redirect_to admins_admin_categories_generations_path
    end
  end

  private
  
  def set_generation
    @generation = Generation.find(params[:id])
  end

  def generation_params
    params.require(:generation).permit(:years)
  end
end
