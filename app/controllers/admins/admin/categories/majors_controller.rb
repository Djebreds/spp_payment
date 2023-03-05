class Admins::Admin::Categories::MajorsController < ApplicationController
  before_action :set_major, only: [:edit, :update, :destroy]
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: MajorDatatable.new(params) }
    end
  end

  def new 
    @major = Major.new
  end

  def create
    @major = Major.new(major_params)

    if @major.save
      flash[:notice] = "Jurusan berhasil ditambahkan"
      redirect_to admins_admin_categories_majors_path
    else
      flash[:alert] = "Jurusan gagal ditambahkan"
      render :new
    end
  end

  def edit
  end

  def update
    if @major.update(major_params)
      flash[:notice] = "Jurusan berhasil diubah"
      redirect_to admins_admin_categories_majors_path
    else
      flash[:alert] = "Jurusan gagal diubah"
      render :edit
    end
  end

  def destroy
    if @major.destroy!
      flash[:notice] = 'Jurusan berhasil dihapus'
      redirect_to admins_admin_categories_majors_path
    else
      flash[:alert] = 'Jurusan gagal dihapus'
      redirect_to admins_admin_categories_majors_path
    end
  end

  private

  def set_major
    @major = Major.find(params[:id])
  end

  def major_params
    params.require(:major).permit(:name, :short)
  end

end
